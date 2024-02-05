linearmodel <- function(formular, data, is.anova = 0, is.coef = 0, is.residuals = 0, is.fittedvalue = 0,
    is.influence = 0, is.rstandard = 0, is.rstudent = 0, is.cook = 0, is.hatvalue = 0, is.plot = 0,
    plotwhich = 1, is.Breusch_Godfrey_Test = 0, is.Breusch_Pagan_Test = 0, totest.autocorr.lag = 1,
    is.coefci = 0, is.dwtest = 0, is.Goldfeld_Quandt_Test = 0, is.Harvey_Collier_Test = 0, is.Harrison_McCabe_Test = 0,
    is.add_variable_plot = 0, addwhich_var = NULL, level = 0.95, alternative = NULL, newdata = NULL) {
    # 存储返回值的列表
    return.list <- list()
    # 拟合线性模型
    lmod <- lm(formula = formular, data = data)
    # 将模型添加到列表中
    return.list$模型 <- lmod
    # 输出结果
    print("模型估计结果如下：")
    print(summary(lmod))
    # 输出模型的方差分析结果
    if (as.logical(is.anova)) {
        anova.result <- anova(lmod)
        print("方差分析结果如下：")
        print(anova.result)
        # 将方差分析结果添加到列表中
        return.list$方差分析表 <- anova.result
    }
    # 系数估计值
    if (as.logical(is.coef)) {
        print("系数估计结果如下：")
        coef.result <- lmod$coefficients
        print(coef.result)
        # 将系数结果添加到列表中
        return.list$系数 <- coef.result
    }
    # 残差向量
    if (as.logical(is.residuals)) {
        print("残差结果如下：")
        resid.result <- lmod$residuals
        print(resid.result)
        # 将残差结果添加到列表中
        return.list$残差 <- resid.result
    }
    # 拟合值
    if (as.logical(is.fittedvalue)) {
        print("拟合值结果如下：")
        fittedval.result <- lmod$fitted.values
        print(fittedval.result)
        # 将拟合值结果添加到列表中
        return.list$拟合值 <- fittedval.result
    }
    # 影响值
    if (as.logical(is.influence)) {
        print("影响值结果如下：")
        infl.result <- influence.measures(lmod)
        print(infl.result)
        # 将影响值结果添加到列表中
        return.list$影响值 <- infl.result$infmat
    }
    # 标准化残差
    if (as.logical(is.rstandard)) {
        print("标准化残差结果如下：")
        rstandard.result <- rstandard(lmod)
        print(rstandard.result)
        # 将标准化残差值结果添加到列表中
        return.list$标准化残差 <- rstandard.result
    }
    # 学生化残差
    if (as.logical(is.rstudent)) {
        print("学生化残差结果如下：")
        rstudent.result <- rstudent(lmod)
        print(rstudent.result)
        # 将学生化残差值结果添加到列表中
        return.list$学生化残差 <- rstudent.result
    }
    # cook距离
    if (as.logical(is.cook)) {
        print("cook距离结果如下：")
        cookdist.result <- cooks.distance(lmod)
        print(cookdist.result)
        # 将cook距离值结果添加到列表中
        return.list$cook距离 <- cookdist.result
    }
    # 帽子值
    if (as.logical(is.hatvalue)) {
        print("帽子值结果如下：")
        hatvals.result <- hatvalues(lmod)
        print(hatvals.result)
        # 将帽子值结果添加到列表中
        return.list$帽子值 <- hatvals.result
    }
    # 回归诊断图
    if (as.logical(is.plot)) {
        print("绘制回归诊断图如下：")
        plot(lmod, which = plotwhich)
    }
    # 误差自相关检验
    if (as.logical(is.Breusch_Godfrey_Test)) {
        require(lmtest)
        print("Breusch-Godfrey Test结果如下")
        print("H0: 误差之间不存在小于或等于p的阶数的自相关")
        bgtest.result <- lmtest::bgtest(formula = formular, order = totest.autocorr.lag, data = data)
        print(bgtest.result)
        # 将检验结果添加到列表中
        return.list$Breusch_Godfrey_Test <- bgtest.result
    }
    # 误差一阶自相关（dwtest）检验
    if (as.logical(is.dwtest)) {
        require(lmtest)
        print("DW检验结果如下")
        dwtest.result <- lmtest::dwtest(formula = formular, data = data, alternative = alternative)
        print(dwtest.result)
        # 将检验结果添加到列表中
        return.list$dwtest <- dwtest.result
    }
    # 异方差检验
    if (as.logical(is.Breusch_Pagan_Test)) {
        require(lmtest)
        print("Breusch-Pagan Test结果如下")
        print("H0: 误差之间不存在异方差性")
        bptest.result <- lmtest::bptest(formula = formular, data = data)
        print(bptest.result)
        # 将检验结果添加到列表中
        return.list$Breusch_Pagan_Test <- bptest.result
    }
    # 异方差检验
    if (as.logical(is.Goldfeld_Quandt_Test)) {
        require(lmtest)
        print("Goldfeld-Quandt Test结果如下")
        gqtest.result <- lmtest::gqtest(formula = formular, data = data, alternative = alternative)
        print(gqtest.result)
        # 将检验结果添加到列表中
        return.list$Goldfeld_Quandt_Test <- gqtest.result
    }
    # 异方差检验
    if (as.logical(is.Harrison_McCabe_Test)) {
        require(lmtest)
        print("Harrison McCabe Test结果如下")
        print("H0: 误差之间不存在异方差")
        hmctest.result <- lmtest::hmctest(formula = formular, data = data)
        print(hmctest.result)
        # 将检验结果添加到列表中
        return.list$Harrison_McCabe_Test <- hmctest.result
    }
    # 模型线性检验
    if (as.logical(is.Harvey_Collier_Test)) {
        require(lmtest)
        print("Harvey Collier Test结果如下")
        print("H0: 模型是线性的")
        harvtest.result <- lmtest::harvtest(formula = formular, data = data)
        print(harvtest.result)
        # 将检验结果添加到列表中
        return.list$Harvey_Collier_Test <- harvtest.result
    }
    # 系数的置信区间
    if (as.logical(is.coefci)) {
        print("系数的置信区间")
        coefci.result <- confint(lmod, level = level)
        print(coefci.result)
        # 将检验结果添加到列表中
        return.list$系数置信区间 <- coefci.result
    }
    # 变量添加图
    if (as.logical(is.add_variable_plot)) {
        require(car)
        print("变量添加图如下：")
        car::avPlot(lmod, addwhich_var)
    }
    # 预测值
    if (!is.null(newdata)) {
        print("预测值结果如下：")
        prdvalue.result <- predict(lmod, newdata)
        print(prdvalue.result)
        # 将拟合值结果添加到列表中
        return.list$预测值 <- prdvalue.result
    }
    return(return.list)
}
