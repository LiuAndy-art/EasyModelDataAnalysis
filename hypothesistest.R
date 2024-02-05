hypothesistest <- function(x, y = NULL, test.type = "1t-test", param.list = NULL, alternative = "two.sided",
    level = 0.95, var.equal = 1, cor.method = "pearson", ...) {
    # 单正态总体t检验，param.list的参数名称为mu
    if (test.type == "t") {
        test.result <- t.test(x, mu = param.list$mu, alternative = alternative, conf.level = level)
    }
    # 单正态总体z检验，param.list的参数名称为mu, sigma2
    if (test.type == "z") {
        require(BSDA)
        test.result <- BSDA::z.test(x, mu = param.list$mu, sigma.x = param.list$sigma2, alternative = alternative,
            conf.level = level)
    }
    # 两正态总体方差齐性检验, param.list的参数名称为ratio
    if (test.type == "var") {
        test.result <- var.test(x, y, ratio = ifelse(is.null(param.list$ratio), 1, param.list$ratio),
            alternative = alternative, conf.level = level)
    }
    # 两正态总体均值检验, param.list的参数为mu
    if (test.type == "2t") {
        test.result <- t.test(x, y, mu = ifelse(is.null(param.list$mu), 0, param.list$mu), alternative = alternative,
            conf.level = level, var.equal = as.logical(var.equal))
    }
    # 成对t检验，param.list的参数为mu
    if (test.type == "pair-t") {
        test.result <- t.test(x, y, mu = ifelse(is.null(param.list$mu), 0, param.list$mu), alternative = alternative,
            conf.level = level, paired = TRUE, var.equal = as.logical(var.equal))
    }
    # 二项精确检验
    if (test.type == "binom") {
        test.result <- binom.test(x, n = ifelse(is.null(param.list$n), sum(x), param.list$n),
            p = param.list$p, alternative = alternative, conf.level = level)
    }
    # 符号检验
    if (test.type == "sign") {
        xx <- ifelse(x - param.list$Q > 0, 1, 0)
        test.result <- binom.test(sum(xx), n = ifelse(is.null(param.list$n), length(x), param.list$n),
            p = param.list$p, alternative = alternative, conf.level = level)
    }
    # 单样本比例检验（渐近正态）,param.list的参数为n,p
    if (test.type == "prop") {
        test.result <- prop.test(x, n = param.list$n, p = param.list$p, alternative = alternative,
            conf.level = level)
    }
    # 两样本比例检验（渐近正态）,param.list的参数为n,p
    if (test.type == "2prop") {
        test.result <- prop.test(c(sum(x), sum(y)), n = c(length(x), length(y)), p = param.list$p,
            alternative = alternative, conf.level = level)
    }
    # 多样本比例检验（渐近正态）,param.list的参数为n,p
    if (test.type == "M_prop") {
        test.result <- prop.test(x, n = param.list$n, p = param.list$p, alternative = alternative,
            conf.level = level)
    }
    # 卡方拟合优度检验，param.list的参数为p
    if (test.type == "gof") {
        if (is.null(param.list$p)) {
            exp_p <- rep(1/length(x), length(x))
        } else {
            exp_p <- param.list$p
        }
        test.result <- chisq.test(x, p = exp_p)
    }
    # 列联表独立性检验,param.list无参数
    if (test.type == "contingency_table") {
        test.result <- chisq.test(x)
    }
    # Shapiro-Wilk正态性检验，param.list无参数
    if (test.type == "shapiro") {
        test.result <- shapiro.test(x)
    }
    # 单样本的ks分布检验,param.list参数为dist
    if (test.type == "ks") {
        test.result <- ks.test(x, ifelse(is.null(param.list$dist), "pnorm", param.list$dist),
            ...)
    }
    # 两样本的ks同分布检验，param.list无参数
    if (test.type == "2ks") {
        test.result <- ks.test(x, y)
    }
    # 相关系数检验，param.list无参数
    if (test.type == "cor") {
        test.result <- cor.test(x, y, alternative = alternative, conf.level = level, method = cor.method)
    }
    # 两样本bartlett方差齐性检验,param.list无参数
    if (test.type == "bartlett") {
        test.result <- bartlett.test(x, y)
    }
    # 多样本levene方差齐性检验
    if (test.type == "levene") {
        require(car)
        test.result <- car::leveneTest(x, y)
    }
    # 游程检验
    if (test.type == "runtest") {
        require(tseries)
        test.result <- tseries::runs.test(as.factor(x), alternative = alternative)
    }
    # 非参数单样本中位数的检验，符号秩检验,param.list的参数为mu
    if (test.type == "signrank") {
        test.result <- wilcox.test(x, mu = ifelse(is.null(param.list), 0, param.list$mu), alternative = alternative,
            conf.level = level, conf.int = TRUE)
    }
    # 非参数两样本中位数相等的检验，秩和检验,param.list无参数
    if (test.type == "ranksum") {
        test.result <- wilcox.test(x, y, alternative = alternative, conf.level = level, conf.int = TRUE)
    }
    # 非参数成对样本中位数相等的检验，秩和检验,param.list无参数
    if (test.type == "pair-ranksum") {
        test.result <- wilcox.test(x, y, alternative = alternative, conf.level = level, paired = TRUE,
            conf.int = TRUE)
    }
    # 列联表独立性Fisher精确检验,param.list无参数
    if (test.type == "fisherexact-contingency_table") {
        test.result <- fisher.test(x, alternative = alternative, conf.level = level)
    }
    # Cox-staut趋势性检验
    if (test.type == "cox-staut") {
        require(trend)
        test.result <- trend::cs.test(x)
    }
    # Mann-Kendall趋势性检验
    if (test.type == "Mann-Kendall") {
        require(trend)
        test.result <- trend::mk.test(x, alternative = alternative)
    }
    # 非参数两样本方差相等Mood检验
    if (test.type == "mood-2var") {
        test.result <- mood.test(x, y, alternative = alternative)
    }
    # 非参数两样本方差相等Fligner-Killeen检验
    if (test.type == "Fligner-Killeen-2var") {
        test.result <- fligner.test(x, y)
    }
    # 非参数两样本方差相等Ansari-Bradley检验
    if (test.type == "Ansari-Bradley-2var") {
        test.result <- ansari.test(x, y, alternative = alternative, conf.int = TRUE, conf.level = level)
    }
    # 非参数多样本中位数的检验Kruskal-Wallis检验
    if (test.type == "Kruskal-wallis-ranksum") {
        test.result <- kruskal.test(x, y)
    }
    # 时间序列白噪声检验Box-Pierce检验,param.list的参数为lag
    if (test.type == "Box-Pierce") {
        test.result <- Box.test(x, lag = ifelse(is.null(param.list), 1, param.list$lag), type = "Box-Pierce")
    }
    # 时间序列白噪声检验Ljung-Box检验,param.list的参数为lag
    if (test.type == "Ljung-Box") {
        test.result <- Box.test(x, lag = ifelse(is.null(param.list), 1, param.list$lag), type = "Ljung-Box")
    }
    # 非参数无重复因素的方差分析
    if (test.type == "friedman-ranksum") {
        test.result <- friedman.test(x, y)
    }
    print(test.result)
    return(test.result)
}
