# 假设检验

## 单正态总体均值检验(t检验)

### 双边检验


```r
source("../hypothesistest.R")
res <- hypothesistest(women$height, param.list=list(mu=60), test.type = "t")
```

```
## 
## 	One Sample t-test
## 
## data:  x
## t = 4.3301, df = 14, p-value = 0.000692
## alternative hypothesis: true mean is not equal to 60
## 95 percent confidence interval:
##  62.52341 67.47659
## sample estimates:
## mean of x 
##        65
```
### 左边检验


```r
source("../hypothesistest.R")
res <- hypothesistest(women$height, param.list=list(mu=60), test.type = "t", alternative = "less", level=0.9)
```

```
## 
## 	One Sample t-test
## 
## data:  x
## t = 4.3301, df = 14, p-value = 0.9997
## alternative hypothesis: true mean is less than 60
## 90 percent confidence interval:
##      -Inf 66.55311
## sample estimates:
## mean of x 
##        65
```
### 右边检验


```r
source("../hypothesistest.R")
res <- hypothesistest(women$height, param.list=list(mu=60), test.type = "t", alternative="greater", level=0.99)
```

```
## 
## 	One Sample t-test
## 
## data:  x
## t = 4.3301, df = 14, p-value = 0.000346
## alternative hypothesis: true mean is greater than 60
## 99 percent confidence interval:
##  61.9695     Inf
## sample estimates:
## mean of x 
##        65
```

## 单正态总体均值检验(z检验)

### 双边检验


```r
source("../hypothesistest.R")
res <- hypothesistest(women$height, param.list=list(mu=60, sigma2=10), test.type = "z")
```

```
## 
## 	One-sample z-Test
## 
## data:  x
## z = 1.9365, p-value = 0.05281
## alternative hypothesis: true mean is not equal to 60
## 95 percent confidence interval:
##  59.93939 70.06061
## sample estimates:
## mean of x 
##        65
```

### 左边检验


```r
source("../hypothesistest.R")
res <- hypothesistest(women$height, param.list=list(mu=60, sigma2=10), test.type = "z", alternative = "less", level=0.9)
```

```
## 
## 	One-sample z-Test
## 
## data:  x
## z = 1.9365, p-value = 0.9736
## alternative hypothesis: true mean is less than 60
## 90 percent confidence interval:
##        NA 68.30895
## sample estimates:
## mean of x 
##        65
```

### 右边检验


```r
source("../hypothesistest.R")
res <- hypothesistest(women$height, param.list=list(mu=60, sigma2=10), test.type = "z", alternative = "greater", level=0.99)
```

```
## 
## 	One-sample z-Test
## 
## data:  x
## z = 1.9365, p-value = 0.0264
## alternative hypothesis: true mean is greater than 60
## 99 percent confidence interval:
##  58.9934      NA
## sample estimates:
## mean of x 
##        65
```

## 两正态总体方差齐性检验

### 双边检验


```r
source("../hypothesistest.R")
res <- hypothesistest(women$height, women$weight, test.type = "var")
```

```
## 
## 	F test to compare two variances
## 
## data:  x and y
## F = 0.083261, num df = 14, denom df = 14, p-value = 3.586e-05
## alternative hypothesis: true ratio of variances is not equal to 1
## 95 percent confidence interval:
##  0.02795306 0.24799912
## sample estimates:
## ratio of variances 
##         0.08326065
```
### 左边检验

```r
source("../hypothesistest.R")
res <- hypothesistest(women$height, women$weight, test.type = "var", alternative="less", level=0.9)
```

```
## 
## 	F test to compare two variances
## 
## data:  x and y
## F = 0.083261, num df = 14, denom df = 14, p-value = 1.793e-05
## alternative hypothesis: true ratio of variances is less than 1
## 90 percent confidence interval:
##  0.0000000 0.1683892
## sample estimates:
## ratio of variances 
##         0.08326065
```

### 右边检验


```r
source("../hypothesistest.R")
res <- hypothesistest(women$height, women$weight, test.type = "var", alternative="greater", level=0.99)
```

```
## 
## 	F test to compare two variances
## 
## data:  x and y
## F = 0.083261, num df = 14, denom df = 14, p-value = 1
## alternative hypothesis: true ratio of variances is greater than 1
## 99 percent confidence interval:
##  0.02251784        Inf
## sample estimates:
## ratio of variances 
##         0.08326065
```

### 公式分组


```r
source("../hypothesistest.R")
res <- hypothesistest(age~sex,  carData::Arrests, test.type = "var")
```

```
## 
## 	F test to compare two variances
## 
## data:  age by sex
## F = 1.0777, num df = 442, denom df = 4782, p-value = 0.2735
## alternative hypothesis: true ratio of variances is not equal to 1
## 95 percent confidence interval:
##  0.9426155 1.2420884
## sample estimates:
## ratio of variances 
##           1.077718
```

## 两正态总体均值检验

### 双边检验


```r
source("../hypothesistest.R")
res <- hypothesistest(carData::Arrests$age[carData::Arrests$sex=="Male"], carData::Arrests$age[carData::Arrests$sex=="Female"], test.type = "2t")
```

```
## 
## 	Two Sample t-test
## 
## data:  x and y
## t = 0.83016, df = 5224, p-value = 0.4065
## alternative hypothesis: true difference in means is not equal to 0
## 95 percent confidence interval:
##  -0.4668146  1.1525540
## sample estimates:
## mean of x mean of y 
##  23.87560  23.53273
```

### 左边检验


```r
source("../hypothesistest.R")
res <- hypothesistest(carData::Arrests$age[carData::Arrests$sex=="Male"], carData::Arrests$age[carData::Arrests$sex=="Female"], test.type = "2t", alternative = "less", level=0.9, param.list=list(mu=0.3))
```

```
## 
## 	Two Sample t-test
## 
## data:  x and y
## t = 0.1038, df = 5224, p-value = 0.5413
## alternative hypothesis: true difference in means is less than 0.3
## 90 percent confidence interval:
##       -Inf 0.8722381
## sample estimates:
## mean of x mean of y 
##  23.87560  23.53273
```

### 右边检验


```r
source("../hypothesistest.R")
res <- hypothesistest(carData::Arrests$age[carData::Arrests$sex=="Male"], carData::Arrests$age[carData::Arrests$sex=="Female"], test.type = "2t", alternative = "greater", level=0.99, param.list=list(mu=0.3))
```

```
## 
## 	Two Sample t-test
## 
## data:  x and y
## t = 0.1038, df = 5224, p-value = 0.4587
## alternative hypothesis: true difference in means is greater than 0.3
## 99 percent confidence interval:
##  -0.6182444        Inf
## sample estimates:
## mean of x mean of y 
##  23.87560  23.53273
```
### 公式分组


```r
source("../hypothesistest.R")
res <- hypothesistest(age~sex, carData::Arrests, test.type = "2t")
```

```
## 
## 	Two Sample t-test
## 
## data:  age by sex
## t = -0.83016, df = 5224, p-value = 0.4065
## alternative hypothesis: true difference in means between group Female and group Male is not equal to 0
## 95 percent confidence interval:
##  -1.1525540  0.4668146
## sample estimates:
## mean in group Female   mean in group Male 
##             23.53273             23.87560
```

## 成对t检验

### 双边检验


```r
source("../hypothesistest.R")
res <- hypothesistest(women$height, women$weight, test.type = "pair-t")
```

```
## 
## 	Paired t-test
## 
## data:  x and y
## t = -25.131, df = 14, p-value = 4.77e-13
## alternative hypothesis: true mean difference is not equal to 0
## 95 percent confidence interval:
##  -77.85530 -65.61137
## sample estimates:
## mean difference 
##       -71.73333
```

### 左边检验


```r
source("../hypothesistest.R")
res <- hypothesistest(women$height, women$weight, test.type = "pair-t", alternative = "less", level=0.9, param.list=list(mu=0.3))
```

```
## 
## 	Paired t-test
## 
## data:  x and y
## t = -25.236, df = 14, p-value = 2.252e-13
## alternative hypothesis: true mean difference is less than 0.3
## 90 percent confidence interval:
##       -Inf -67.89415
## sample estimates:
## mean difference 
##       -71.73333
```

### 右边检验


```r
source("../hypothesistest.R")
res <- hypothesistest(women$height, women$weight, test.type = "pair-t", alternative = "greater", level=0.99, param.list=list(mu=0.3))
```

```
## 
## 	Paired t-test
## 
## data:  x and y
## t = -25.236, df = 14, p-value = 1
## alternative hypothesis: true mean difference is greater than 0.3
## 99 percent confidence interval:
##  -79.22455       Inf
## sample estimates:
## mean difference 
##       -71.73333
```

### 公式分组


```r
source("../hypothesistest.R")
res <- hypothesistest(defectives~manufacturer, BSDA::Autogear, test.type = "pair-t")
```

```
## 
## 	Paired t-test
## 
## data:  defectives by manufacturer
## t = -2.8393, df = 19, p-value = 0.01048
## alternative hypothesis: true mean difference is not equal to 0
## 95 percent confidence interval:
##  -8.598917 -1.301083
## sample estimates:
## mean difference 
##           -4.95
```

## 精确比例检验（二项检验）

给定成功事件的次数和总次数，以及要检验的成功事件概率p值。

### 双边检验


```r
source("../hypothesistest.R")
res <- hypothesistest(100, param.list=list(n=300, p=0.5), test.type = "binom")
```

```
## 
## 	Exact binomial test
## 
## data:  x and ifelse(is.null(param.list$n), sum(x), param.list$n)
## number of successes = 100, number of trials = 300, p-value = 8.015e-09
## alternative hypothesis: true probability of success is not equal to 0.5
## 95 percent confidence interval:
##  0.2802048 0.3897924
## sample estimates:
## probability of success 
##              0.3333333
```

给定成功事件的次数和失败的次数，以及要检验的成功事件概率p值。


```r
source("../hypothesistest.R")
res <- hypothesistest(c(100, 90), param.list=list(p=0.5), test.type = "binom")
```

```
## 
## 	Exact binomial test
## 
## data:  x
## number of successes = 100, number of trials = 190, p-value = 0.5139
## alternative hypothesis: true probability of success is not equal to 0.5
## 95 percent confidence interval:
##  0.4527599 0.5990377
## sample estimates:
## probability of success 
##              0.5263158
```

### 左边检验

给定成功事件的次数和总次数，以及要检验的成功事件概率p值。


```r
source("../hypothesistest.R")
res <- hypothesistest(100, param.list=list(n=300, p=0.5), test.type = "binom", alternative = "less", level=0.9)
```

```
## 
## 	Exact binomial test
## 
## data:  x and ifelse(is.null(param.list$n), sum(x), param.list$n)
## number of successes = 100, number of trials = 300, p-value = 4.007e-09
## alternative hypothesis: true probability of success is less than 0.5
## 90 percent confidence interval:
##  0.0000000 0.3706351
## sample estimates:
## probability of success 
##              0.3333333
```


给定成功事件的次数和失败的次数，以及要检验的成功事件概率p值。


```r
source("../hypothesistest.R")
res <- hypothesistest(c(100, 90), param.list=list(p=0.5), test.type = "binom", alternative = "less", level=0.9)
```

```
## 
## 	Exact binomial test
## 
## data:  x
## number of successes = 100, number of trials = 190, p-value = 0.7875
## alternative hypothesis: true probability of success is less than 0.5
## 90 percent confidence interval:
##  0.0000000 0.5749791
## sample estimates:
## probability of success 
##              0.5263158
```

### 右边检验

给定成功事件的次数和总次数，以及要检验的成功事件概率p值。


```r
source("../hypothesistest.R")
res <- hypothesistest(100, param.list=list(n=300, p=0.5), test.type = "binom", alternative = "greater", level=0.99)
```

```
## 
## 	Exact binomial test
## 
## data:  x and ifelse(is.null(param.list$n), sum(x), param.list$n)
## number of successes = 100, number of trials = 300, p-value = 1
## alternative hypothesis: true probability of success is greater than 0.5
## 99 percent confidence interval:
##  0.2709409 1.0000000
## sample estimates:
## probability of success 
##              0.3333333
```

给定成功事件的次数和失败的次数，以及要检验的成功事件概率p值。


```r
source("../hypothesistest.R")
res <- hypothesistest(c(100, 90), param.list=list(p=0.5), test.type = "binom", alternative = "greater", level=0.99)
```

```
## 
## 	Exact binomial test
## 
## data:  x
## number of successes = 100, number of trials = 190, p-value = 0.257
## alternative hypothesis: true probability of success is greater than 0.5
## 99 percent confidence interval:
##  0.4396122 1.0000000
## sample estimates:
## probability of success 
##              0.5263158
```

### 无法直接对01序列检验

二项检验不可以直接对01序列检验，需要频数求解或者求和之后再检验，以双边检验为例。


```r
source("../hypothesistest.R")
x <- rbinom(30, 1, 0.58)
res <- hypothesistest(sum(x), param.list=list(n=length(x), p=0.5), test.type = "binom")
```

```
## 
## 	Exact binomial test
## 
## data:  x and ifelse(is.null(param.list$n), sum(x), param.list$n)
## number of successes = 16, number of trials = 30, p-value = 0.8555
## alternative hypothesis: true probability of success is not equal to 0.5
## 95 percent confidence interval:
##  0.3432552 0.7165819
## sample estimates:
## probability of success 
##              0.5333333
```
## 符号检验

### 双边检验


```r
source("../hypothesistest.R")
x <- rbinom(30, 100, 0.58)
res <- hypothesistest(x, param.list=list(Q=58, p=0.5), test.type = "sign")
```

```
## 
## 	Exact binomial test
## 
## data:  sum(xx) and ifelse(is.null(param.list$n), length(x), param.list$n)
## number of successes = 10, number of trials = 30, p-value = 0.09874
## alternative hypothesis: true probability of success is not equal to 0.5
## 95 percent confidence interval:
##  0.1728742 0.5281200
## sample estimates:
## probability of success 
##              0.3333333
```
### 左边检验


```r
source("../hypothesistest.R")
x <- rbinom(30, 100, 0.58)
res <- hypothesistest(x, param.list=list(Q=58, p=0.5), test.type = "sign", alternative = "less", level=0.9)
```

```
## 
## 	Exact binomial test
## 
## data:  sum(xx) and ifelse(is.null(param.list$n), length(x), param.list$n)
## number of successes = 12, number of trials = 30, p-value = 0.1808
## alternative hypothesis: true probability of success is less than 0.5
## 90 percent confidence interval:
##  0.0000000 0.5334337
## sample estimates:
## probability of success 
##                    0.4
```

### 右边检验


```r
source("../hypothesistest.R")
x <- rbinom(30, 100, 0.58)
res <- hypothesistest(x, param.list=list(Q=58, p=0.5), test.type = "sign", alternative = "greater", level=0.99)
```

```
## 
## 	Exact binomial test
## 
## data:  sum(xx) and ifelse(is.null(param.list$n), length(x), param.list$n)
## number of successes = 14, number of trials = 30, p-value = 0.7077
## alternative hypothesis: true probability of success is greater than 0.5
## 99 percent confidence interval:
##  0.2555039 1.0000000
## sample estimates:
## probability of success 
##              0.4666667
```
## 单样本比例检验(渐近正态)

给定成功事件的次数和总次数，以及要检验的成功事件概率p值。

### 双边检验


```r
source("../hypothesistest.R")
res <- hypothesistest(100, param.list=list(n=300, p=0.5), test.type = "prop")
```

```
## 
## 	1-sample proportions test with continuity correction
## 
## data:  x out of param.list$n, null probability param.list$p
## X-squared = 32.67, df = 1, p-value = 1.092e-08
## alternative hypothesis: true p is not equal to 0.5
## 95 percent confidence interval:
##  0.2808136 0.3901981
## sample estimates:
##         p 
## 0.3333333
```

### 左边检验

给定成功事件的次数和总次数，以及要检验的成功事件概率p值。


```r
source("../hypothesistest.R")
res <- hypothesistest(100, param.list=list(n=300, p=0.5), test.type = "prop", alternative = "less", level=0.9)
```

```
## 
## 	1-sample proportions test with continuity correction
## 
## data:  x out of param.list$n, null probability param.list$p
## X-squared = 32.67, df = 1, p-value = 5.46e-09
## alternative hypothesis: true p is less than 0.5
## 90 percent confidence interval:
##  0.0000000 0.3707375
## sample estimates:
##         p 
## 0.3333333
```

### 右边检验

给定成功事件的次数和总次数，以及要检验的成功事件概率p值。


```r
source("../hypothesistest.R")
res <- hypothesistest(100, param.list=list(n=300, p=0.5), test.type = "prop", alternative = "greater", level=0.99)
```

```
## 
## 	1-sample proportions test with continuity correction
## 
## data:  x out of param.list$n, null probability param.list$p
## X-squared = 32.67, df = 1, p-value = 1
## alternative hypothesis: true p is greater than 0.5
## 99 percent confidence interval:
##  0.2719058 1.0000000
## sample estimates:
##         p 
## 0.3333333
```

### 无法直接对01序列检验

渐近正态的比例检验不可以直接对01序列检验，以双边检验为例。


```r
source("../hypothesistest.R")
x <- rbinom(30, 1, 0.58)
res <- hypothesistest(sum(x), param.list=list(n=length(x), p=0.5), test.type = "prop")
```

```
## 
## 	1-sample proportions test with continuity correction
## 
## data:  x out of param.list$n, null probability param.list$p
## X-squared = 0.83333, df = 1, p-value = 0.3613
## alternative hypothesis: true p is not equal to 0.5
## 95 percent confidence interval:
##  0.4075022 0.7677666
## sample estimates:
##   p 
## 0.6
```

## 两样本比例相等检验（渐近正态）

这是可以直接对01序列进行检验的。

### 双边检验


```r
source("../hypothesistest.R")
x <- rbinom(30, 1, 0.5)
y <- rbinom(40, 1, 0.58)
res <- hypothesistest(x, y, test.type = "2prop")
```

```
## 
## 	2-sample test for equality of proportions with continuity correction
## 
## data:  c(sum(x), sum(y)) out of c(length(x), length(y))
## X-squared = 0.43117, df = 1, p-value = 0.5114
## alternative hypothesis: two.sided
## 95 percent confidence interval:
##  -0.3727420  0.1560753
## sample estimates:
##    prop 1    prop 2 
## 0.4666667 0.5750000
```

### 左边检验


```r
source("../hypothesistest.R")
x <- rbinom(30, 1, 0.5)
y <- rbinom(40, 1, 0.58)
res <- hypothesistest(x, y, test.type = "2prop", alternative="less", level=0.9)
```

```
## 
## 	2-sample test for equality of proportions with continuity correction
## 
## data:  c(sum(x), sum(y)) out of c(length(x), length(y))
## X-squared = 0.15685, df = 1, p-value = 0.346
## alternative hypothesis: less
## 90 percent confidence interval:
##  -1.0000000  0.1029833
## sample estimates:
## prop 1 prop 2 
##  0.600  0.675
```

### 右边检验


```r
source("../hypothesistest.R")
x <- rbinom(30, 1, 0.5)
y <- rbinom(40, 1, 0.58)
res <- hypothesistest(x, y, test.type = "2prop", alternative="greater", level=0.99)
```

```
## 
## 	2-sample test for equality of proportions with continuity correction
## 
## data:  c(sum(x), sum(y)) out of c(length(x), length(y))
## X-squared = 0, df = 1, p-value = 0.5
## alternative hypothesis: greater
## 99 percent confidence interval:
##  -0.2970922  1.0000000
## sample estimates:
##    prop 1    prop 2 
## 0.4666667 0.4750000
```
## 多样本比例相等检验（渐近正态）

给定多个实验组下，成功事件的次数和总试验次数即可。

### 双边检验


```r
source("../hypothesistest.R")
x <- c(20, 34, 45, 56)
n <- c(30, 40, 50, 60)
res <- hypothesistest(x, param.list=list(n=n), test.type = "M_prop")
```

```
## Warning in prop.test(x, n = param.list$n, p = param.list$p, alternative = alternative, :
## Chi-squared近似算法有可能不准
```

```
## 
## 	4-sample test for equality of proportions without continuity correction
## 
## data:  x out of param.list$n
## X-squared = 12.774, df = 3, p-value = 0.005151
## alternative hypothesis: two.sided
## sample estimates:
##    prop 1    prop 2    prop 3    prop 4 
## 0.6666667 0.8500000 0.9000000 0.9333333
```
给定多个实验组下，成功事件的次数和总试验次数即可。

### 左边检验


```r
source("../hypothesistest.R")
x <- c(20, 34, 45, 56)
n <- c(30, 40, 50, 60)
res <- hypothesistest(x, param.list=list(n=n), test.type = "M_prop", alternative="less", level=0.9)
```

```
## Warning in prop.test(x, n = param.list$n, p = param.list$p, alternative = alternative, :
## Chi-squared近似算法有可能不准
```

```
## 
## 	4-sample test for equality of proportions without continuity correction
## 
## data:  x out of param.list$n
## X-squared = 12.774, df = 3, p-value = 0.005151
## alternative hypothesis: two.sided
## sample estimates:
##    prop 1    prop 2    prop 3    prop 4 
## 0.6666667 0.8500000 0.9000000 0.9333333
```
给定多个实验组下，成功事件的次数和总试验次数即可。

### 右边检验


```r
source("../hypothesistest.R")
x <- c(20, 34, 45, 56)
n <- c(30, 40, 50, 60)
res <- hypothesistest(x, param.list=list(n=n), test.type = "M_prop", alternative="greater", level=0.99)
```

```
## Warning in prop.test(x, n = param.list$n, p = param.list$p, alternative = alternative, :
## Chi-squared近似算法有可能不准
```

```
## 
## 	4-sample test for equality of proportions without continuity correction
## 
## data:  x out of param.list$n
## X-squared = 12.774, df = 3, p-value = 0.005151
## alternative hypothesis: two.sided
## sample estimates:
##    prop 1    prop 2    prop 3    prop 4 
## 0.6666667 0.8500000 0.9000000 0.9333333
```
## 卡方拟合优度检验

拟合优度只有双边检验。


```r
source("../hypothesistest.R")
x <- c(20, 34, 45, 56)
# 均匀分布检验
res <- hypothesistest(x, test.type = "gof")
```

```
## 
## 	Chi-squared test for given probabilities
## 
## data:  x
## X-squared = 18.342, df = 3, p-value = 0.0003739
```


```r
source("../hypothesistest.R")
x <- c(20, 34, 45, 56)
res <- hypothesistest(x, test.type = "gof", param.list=list(p=c(0.1, 0.2, 0.3, 0.4)))
```

```
## 
## 	Chi-squared test for given probabilities
## 
## data:  x
## X-squared = 2.2258, df = 3, p-value = 0.5269
```

## 列联表独立性检验

列联表独立性检验只有双边检验，检验两个变量是否有关系。

只能输入一个矩阵或者table作为参数。


```r
source("../hypothesistest.R")
x <- as.table(rbind(c(762, 327, 468), c(484, 239, 477)))
dimnames(x) <- list(gender = c("F", "M"), party = c("Democrat","Independent", "Republican"))
res <- hypothesistest(x, test.type = "contingency_table")
```

```
## 
## 	Pearson's Chi-squared test
## 
## data:  x
## X-squared = 30.07, df = 2, p-value = 2.954e-07
```
## Shapiro-Wilk正态性检验

只能检验数据是否为正态分布，只能是“双边检验”。


```r
source("../hypothesistest.R")
res <- hypothesistest(women$height, test.type = "shapiro")
```

```
## 
## 	Shapiro-Wilk normality test
## 
## data:  x
## W = 0.96359, p-value = 0.7545
```
## KS正态性检验

需要给定一些分布的参数，按照R中基本分布函数pxxx中的参数给定即可。


```r
source("../hypothesistest.R")
res <- hypothesistest(women$height, test.type = "ks", param.list=list(dist="pnorm"), mean=mean(women$height), sd=sd(women$height))
```

```
## 
## 	Exact one-sample Kolmogorov-Smirnov test
## 
## data:  x
## D = 0.082166, p-value = 0.9997
## alternative hypothesis: two-sided
```

## 两样本同分布KS检验

直接对两个数据样本检验。


```r
source("../hypothesistest.R")
res <- hypothesistest(women$height, women$weight, test.type = "2ks")
```

```
## 
## 	Exact two-sample Kolmogorov-Smirnov test
## 
## data:  x and y
## D = 1, p-value = 1.289e-08
## alternative hypothesis: two-sided
```
使用公式分组来检验


```r
source("../hypothesistest.R")
res <- hypothesistest(age~sex, carData::Arrests, test.type = "2ks")
```

```
## Warning in ks.test.default(x = DATA[[1L]], y = DATA[[2L]], ...): 并列的时候P-值将近似
```

```
## 
## 	Asymptotic two-sample Kolmogorov-Smirnov test
## 
## data:  age by sex
## D = 0.086892, p-value = 0.004386
## alternative hypothesis: two-sided
```

## 相关系数检验

### 双边检验


```r
source("../hypothesistest.R")
res <- hypothesistest(women$height, women$weight, test.type = "cor", cor.method = "pearson")
```

```
## 
## 	Pearson's product-moment correlation
## 
## data:  x and y
## t = 37.855, df = 13, p-value = 1.091e-14
## alternative hypothesis: true correlation is not equal to 0
## 95 percent confidence interval:
##  0.9860970 0.9985447
## sample estimates:
##       cor 
## 0.9954948
```
### 左边检验


```r
source("../hypothesistest.R")
res <- hypothesistest(women$height, women$weight, test.type = "cor", cor.method = "kendall", alternative="less", level=0.9)
```

```
## 
## 	Kendall's rank correlation tau
## 
## data:  x and y
## T = 105, p-value = 1
## alternative hypothesis: true tau is less than 0
## sample estimates:
## tau 
##   1
```

### 右边检验


```r
source("../hypothesistest.R")
res <- hypothesistest(women$height, women$weight, test.type = "cor", cor.method = "spearman", alternative="greater", level=0.99)
```

```
## 
## 	Spearman's rank correlation rho
## 
## data:  x and y
## S = 1.2434e-13, p-value < 2.2e-16
## alternative hypothesis: true rho is greater than 0
## sample estimates:
## rho 
##   1
```
### 公式分组


```r
source("../hypothesistest.R")
res <- hypothesistest(~CONT+INTG, USJudgeRatings, test.type = "cor", cor.method = "pearson")
```

```
## 
## 	Pearson's product-moment correlation
## 
## data:  CONT and INTG
## t = -0.8605, df = 41, p-value = 0.3945
## alternative hypothesis: true correlation is not equal to 0
## 95 percent confidence interval:
##  -0.4168591  0.1741182
## sample estimates:
##        cor 
## -0.1331909
```

## 两(多)样本bartlett方差齐性检验

只能检验方差是否相等，没有额外的参数。

给定一个数值变量和分组变量


```r
source("../hypothesistest.R")
res <- hypothesistest(carData::Arrests$age, carData::Arrests$sex, test.type = "bartlett")
```

```
## 
## 	Bartlett test of homogeneity of variances
## 
## data:  x and y
## Bartlett's K-squared = 1.1562, df = 1, p-value = 0.2823
```
使用公式分组


```r
source("../hypothesistest.R")
res <- hypothesistest(age~sex, carData::Arrests, test.type = "bartlett")
```

```
## 
## 	Bartlett test of homogeneity of variances
## 
## data:  age by sex
## Bartlett's K-squared = 1.1562, df = 1, p-value = 0.2823
```
## 两(多)样本levene方差齐性检验

只能检验方差是否相等，没有额外的参数。

给定一个数值变量和分组变量


```r
source("../hypothesistest.R")
res <- hypothesistest(carData::Arrests$age, carData::Arrests$sex, test.type = "levene")
```

```
## Levene's Test for Homogeneity of Variance (center = median)
##         Df F value Pr(>F)
## group    1  1.1417 0.2854
##       5224
```

使用公式分组


```r
source("../hypothesistest.R")
res <- hypothesistest(age~sex, carData::Arrests, test.type = "levene")
```

```
## Levene's Test for Homogeneity of Variance (center = median)
##         Df F value Pr(>F)
## group    1  1.1417 0.2854
##       5224
```

## 游程检验

### 双边检验


```r
source("../hypothesistest.R")
x <- rbinom(100, 1, 0.4)
res <- hypothesistest(x, test.type = "runtest")
```

```
## 
## 	Runs Test
## 
## data:  as.factor(x)
## Standard Normal = 0.20948, p-value = 0.8341
## alternative hypothesis: two.sided
```
### 左边检验


```r
source("../hypothesistest.R")
x <- rbinom(100, 1, 0.4)
res <- hypothesistest(x, test.type = "runtest", alternative = "less")
```

```
## 
## 	Runs Test
## 
## data:  as.factor(x)
## Standard Normal = 0.088768, p-value = 0.5354
## alternative hypothesis: less
```
### 右边检验


```r
source("../hypothesistest.R")
x <- rbinom(100, 1, 0.4)
res <- hypothesistest(x, test.type = "runtest", alternative = "greater")
```

```
## 
## 	Runs Test
## 
## data:  as.factor(x)
## Standard Normal = -0.50767, p-value = 0.6942
## alternative hypothesis: greater
```

## 非参数单样本中位数符号秩检验

### 双边检验


```r
source("../hypothesistest.R")
res <- hypothesistest(women$height, test.type = "signrank", alternative = "two.sided", param.list=list(mu=160))
```

```
## 
## 	Wilcoxon signed rank exact test
## 
## data:  x
## V = 0, p-value = 6.104e-05
## alternative hypothesis: true location is not equal to 160
## 95 percent confidence interval:
##  62.5 67.5
## sample estimates:
## (pseudo)median 
##             65
```
### 左边检验


```r
source("../hypothesistest.R")
res <- hypothesistest(women$height, test.type = "signrank", alternative = "less", param.list=list(mu=160), level=0.9)
```

```
## 
## 	Wilcoxon signed rank exact test
## 
## data:  x
## V = 0, p-value = 3.052e-05
## alternative hypothesis: true location is less than 160
## 90 percent confidence interval:
##  -Inf 66.5
## sample estimates:
## (pseudo)median 
##             65
```
### 右边检验


```r
source("../hypothesistest.R")
res <- hypothesistest(women$height, test.type = "signrank", alternative = "greater", param.list=list(mu=160), level=0.99)
```

```
## 
## 	Wilcoxon signed rank exact test
## 
## data:  x
## V = 0, p-value = 1
## alternative hypothesis: true location is greater than 160
## 99 percent confidence interval:
##  61.5  Inf
## sample estimates:
## (pseudo)median 
##             65
```

## 非参数两样本中位数相等秩和检验

### 双边检验


```r
source("../hypothesistest.R")
res <- hypothesistest(carData::Arrests$age[carData::Arrests$sex == "Female"], carData::Arrests$age[carData::Arrests$sex == "Male"], test.type = "ranksum", alternative = "two.sided")
```

```
## 
## 	Wilcoxon rank sum test with continuity correction
## 
## data:  x and y
## W = 987385, p-value = 0.0175
## alternative hypothesis: true location shift is not equal to 0
## 95 percent confidence interval:
##  -1.000061e+00 -1.993879e-05
## sample estimates:
## difference in location 
##             -0.9999921
```
### 左边检验


```r
source("../hypothesistest.R")
res <- hypothesistest(carData::Arrests$age[carData::Arrests$sex == "Female"], carData::Arrests$age[carData::Arrests$sex == "Male"], test.type = "ranksum", alternative = "less", level=0.9)
```

```
## 
## 	Wilcoxon rank sum test with continuity correction
## 
## data:  x and y
## W = 987385, p-value = 0.008752
## alternative hypothesis: true location shift is less than 0
## 90 percent confidence interval:
##           -Inf -3.293574e-05
## sample estimates:
## difference in location 
##             -0.9999921
```


### 右边检验


```r
source("../hypothesistest.R")
res <- hypothesistest(carData::Arrests$age[carData::Arrests$sex == "Female"], carData::Arrests$age[carData::Arrests$sex == "Male"], test.type = "ranksum", alternative = "greater", level=0.99)
```

```
## 
## 	Wilcoxon rank sum test with continuity correction
## 
## data:  x and y
## W = 987385, p-value = 0.9912
## alternative hypothesis: true location shift is greater than 0
## 99 percent confidence interval:
##  -1.00005      Inf
## sample estimates:
## difference in location 
##             -0.9999921
```
### 公式分组


```r
source("../hypothesistest.R")
res <- hypothesistest(age~sex, carData::Arrests, test.type = "ranksum", alternative = "two.sided")
```

```
## 
## 	Wilcoxon rank sum test with continuity correction
## 
## data:  age by sex
## W = 987385, p-value = 0.0175
## alternative hypothesis: true location shift is not equal to 0
## 95 percent confidence interval:
##  -1.000061e+00 -1.993879e-05
## sample estimates:
## difference in location 
##             -0.9999921
```

## 非参数配对样本中位数相等秩和检验

### 双边检验


```r
source("../hypothesistest.R")
res <- hypothesistest(BSDA::Autogear$defectives[BSDA::Autogear$manufacturer == "A"], BSDA::Autogear$defectives[BSDA::Autogear$manufacturer == "B"], test.type = "pair-ranksum", alternative = "two.sided")
```

```
## Warning in wilcox.test.default(x, y, alternative = alternative, conf.level = level, :
## 无法精確計算带连结的p值
```

```
## Warning in wilcox.test.default(x, y, alternative = alternative, conf.level = level, :
## 有连结时无法計算精確的置信区间
```

```
## Warning in wilcox.test.default(x, y, alternative = alternative, conf.level = level, :
## 有0时无法計算精確的p值
```

```
## Warning in wilcox.test.default(x, y, alternative = alternative, conf.level = level, :
## 有零时无法計算精確的置信区间
```

```
## 
## 	Wilcoxon signed rank test with continuity correction
## 
## data:  x and y
## V = 35.5, p-value = 0.01741
## alternative hypothesis: true location shift is not equal to 0
## 95 percent confidence interval:
##  -9.000028 -1.499967
## sample estimates:
## (pseudo)median 
##      -5.999983
```
### 左边检验


```r
source("../hypothesistest.R")
res <- hypothesistest(BSDA::Autogear$defectives[BSDA::Autogear$manufacturer == "A"], BSDA::Autogear$defectives[BSDA::Autogear$manufacturer == "B"], test.type = "pair-ranksum", alternative = "less", level=0.9)
```

```
## Warning in wilcox.test.default(x, y, alternative = alternative, conf.level = level, :
## 无法精確計算带连结的p值
```

```
## Warning in wilcox.test.default(x, y, alternative = alternative, conf.level = level, :
## 有连结时无法計算精確的置信区间
```

```
## Warning in wilcox.test.default(x, y, alternative = alternative, conf.level = level, :
## 有0时无法計算精確的p值
```

```
## Warning in wilcox.test.default(x, y, alternative = alternative, conf.level = level, :
## 有零时无法計算精確的置信区间
```

```
## 
## 	Wilcoxon signed rank test with continuity correction
## 
## data:  x and y
## V = 35.5, p-value = 0.008706
## alternative hypothesis: true location shift is less than 0
## 90 percent confidence interval:
##       -Inf -2.999994
## sample estimates:
## (pseudo)median 
##      -5.999983
```

### 右边检验


```r
source("../hypothesistest.R")
res <- hypothesistest(BSDA::Autogear$defectives[BSDA::Autogear$manufacturer == "A"], BSDA::Autogear$defectives[BSDA::Autogear$manufacturer == "B"], test.type = "pair-ranksum", alternative = "greater", level=0.99)
```

```
## Warning in wilcox.test.default(x, y, alternative = alternative, conf.level = level, :
## 无法精確計算带连结的p值
```

```
## Warning in wilcox.test.default(x, y, alternative = alternative, conf.level = level, :
## 有连结时无法計算精確的置信区间
```

```
## Warning in wilcox.test.default(x, y, alternative = alternative, conf.level = level, :
## 有0时无法計算精確的p值
```

```
## Warning in wilcox.test.default(x, y, alternative = alternative, conf.level = level, :
## 有零时无法計算精確的置信区间
```

```
## 
## 	Wilcoxon signed rank test with continuity correction
## 
## data:  x and y
## V = 35.5, p-value = 0.9922
## alternative hypothesis: true location shift is greater than 0
## 99 percent confidence interval:
##  -10.00003       Inf
## sample estimates:
## (pseudo)median 
##      -5.999983
```
### 公式分组


```r
source("../hypothesistest.R")
res <- hypothesistest(defectives~manufacturer, BSDA::Autogear, test.type = "pair-ranksum")
```

```
## Warning in wilcox.test.default(x = DATA[[1L]], y = DATA[[2L]], ...):
## 无法精確計算带连结的p值
```

```
## Warning in wilcox.test.default(x = DATA[[1L]], y = DATA[[2L]], ...):
## 有连结时无法計算精確的置信区间
```

```
## Warning in wilcox.test.default(x = DATA[[1L]], y = DATA[[2L]], ...): 有0时无法計算精確的p值
```

```
## Warning in wilcox.test.default(x = DATA[[1L]], y = DATA[[2L]], ...):
## 有零时无法計算精確的置信区间
```

```
## 
## 	Wilcoxon signed rank test with continuity correction
## 
## data:  defectives by manufacturer
## V = 35.5, p-value = 0.01741
## alternative hypothesis: true location shift is not equal to 0
## 95 percent confidence interval:
##  -9.000028 -1.499967
## sample estimates:
## (pseudo)median 
##      -5.999983
```

## 列联表独立性Fisher精确检验

### 双边检验


```r
source("../hypothesistest.R")
x <- as.table(rbind(c(762, 327, 468), c(484, 239, 477)))
dimnames(x) <- list(gender = c("F", "M"), party = c("Democrat","Independent", "Republican"))
res <- hypothesistest(x, test.type = "fisherexact-contingency_table")
```

```
## 
## 	Fisher's Exact Test for Count Data
## 
## data:  x
## p-value = 3.027e-07
## alternative hypothesis: two.sided
```

### 左边检验


```r
source("../hypothesistest.R")
x <- as.table(rbind(c(762, 327, 468), c(484, 239, 477)))
dimnames(x) <- list(gender = c("F", "M"), party = c("Democrat","Independent", "Republican"))
res <- hypothesistest(x, test.type = "fisherexact-contingency_table", alternative="less", level=0.9)
```

```
## 
## 	Fisher's Exact Test for Count Data
## 
## data:  x
## p-value = 3.027e-07
## alternative hypothesis: less
```
### 右边检验


```r
source("../hypothesistest.R")
x <- as.table(rbind(c(762, 327, 468), c(484, 239, 477)))
dimnames(x) <- list(gender = c("F", "M"), party = c("Democrat","Independent", "Republican"))
res <- hypothesistest(x, test.type = "fisherexact-contingency_table", alternative="greater", level=0.99)
```

```
## 
## 	Fisher's Exact Test for Count Data
## 
## data:  x
## p-value = 3.027e-07
## alternative hypothesis: greater
```
## cox-staut趋势性检验


```r
source("../hypothesistest.R")
x <- rpois(100, 5)
res <- hypothesistest(x, test.type = "cox-staut")
```

```
## 
## 	Cox and Stuart Trend test
## 
## data:  x
## z = 0.23094, n = 100, p-value = 0.8174
## alternative hypothesis: monotonic trend
```
## Mann-Kendall趋势性检验

### 双边检验


```r
source("../hypothesistest.R")
x <- rpois(100, 5)
res <- hypothesistest(x, test.type = "Mann-Kendall")
```

```
## 
## 	Mann-Kendall trend test
## 
## data:  x
## z = 0.1504, n = 100, p-value = 0.8804
## alternative hypothesis: true S is not equal to 0
## sample estimates:
##            S         varS          tau 
## 5.100000e+01 1.105163e+05 1.097677e-02
```

### 左边检验


```r
source("../hypothesistest.R")
x <- rpois(100, 5)
res <- hypothesistest(x, test.type = "Mann-Kendall", alternative = "less")
```

```
## 
## 	Mann-Kendall trend test
## 
## data:  x
## z = -0.43956, n = 100, p-value = 0.3301
## alternative hypothesis: true S is less than 0
## sample estimates:
##             S          varS           tau 
## -1.470000e+02  1.103257e+05 -3.170442e-02
```

### 右边检验


```r
source("../hypothesistest.R")
x <- rpois(100, 5)
res <- hypothesistest(x, test.type = "Mann-Kendall", alternative = "greater")
```

```
## 
## 	Mann-Kendall trend test
## 
## data:  x
## z = -0.82099, n = 100, p-value = 0.7942
## alternative hypothesis: true S is greater than 0
## sample estimates:
##             S          varS           tau 
## -2.740000e+02  1.105720e+05 -5.887207e-02
```

## 非参数两样本方差相等Mood检验

### 双边检验


```r
source("../hypothesistest.R")
res <- hypothesistest(women$height, women$weight, test.type = "mood-2var")
```

```
## 
## 	Mood two-sample test of scale
## 
## data:  x and y
## Z = 0, p-value = 1
## alternative hypothesis: two.sided
```

### 左边检验


```r
source("../hypothesistest.R")
res <- hypothesistest(women$height, women$weight, test.type = "mood-2var", alternative="less")
```

```
## 
## 	Mood two-sample test of scale
## 
## data:  x and y
## Z = 0, p-value = 0.5
## alternative hypothesis: less
```

### 右边检验


```r
source("../hypothesistest.R")
res <- hypothesistest(women$height, women$weight, test.type = "mood-2var", alternative="greater")
```

```
## 
## 	Mood two-sample test of scale
## 
## data:  x and y
## Z = 0, p-value = 0.5
## alternative hypothesis: greater
```

## 非参数两样本方差相等Fligner-Killeen检验

### 两个样本


```r
source("../hypothesistest.R")
res <- hypothesistest(BSDA::Autogear$defectives[BSDA::Autogear$manufacturer == "A"], BSDA::Autogear$defectives[BSDA::Autogear$manufacturer == "B"], test.type = "Fligner-Killeen-2var")
```

```
## 
## 	Fligner-Killeen test of homogeneity of variances
## 
## data:  x and y
## Fligner-Killeen:med chi-squared = 16.723, df = 14, p-value = 0.2712
```

### 公式分组


```r
source("../hypothesistest.R")
res <- hypothesistest(defectives~manufacturer, BSDA::Autogear, test.type = "Fligner-Killeen-2var")
```

```
## 
## 	Fligner-Killeen test of homogeneity of variances
## 
## data:  defectives by manufacturer
## Fligner-Killeen:med chi-squared = 0.0012717, df = 1, p-value = 0.9716
```

## 非参数两样本方差相等Ansari-Bradley检验

### 双边检验


```r
source("../hypothesistest.R")
res <- hypothesistest(women$height, women$weight, test.type = "Ansari-Bradley-2var")
```

```
## Warning in cci(alpha): 样本的位置不一样：无法计算置信集, 因此回覆NA
```

```
## 
## 	Ansari-Bradley test
## 
## data:  x and y
## AB = 120, p-value = 1
## alternative hypothesis: true ratio of scales is not equal to 1
## 95 percent confidence interval:
##  NA NA
## sample estimates:
## ratio of scales 
##       0.4929215
```

### 左边检验


```r
source("../hypothesistest.R")
res <- hypothesistest(women$height, women$weight, test.type = "Ansari-Bradley-2var", alternative="less", level=0.9)
```

```
## 
## 	Ansari-Bradley test
## 
## data:  x and y
## AB = 120, p-value = 0.5163
## alternative hypothesis: true ratio of scales is less than 1
## 90 percent confidence interval:
##  0.0000000 0.5116279
## sample estimates:
## ratio of scales 
##       0.4929215
```

### 右边检验


```r
source("../hypothesistest.R")
res <- hypothesistest(women$height, women$weight, test.type = "Ansari-Bradley-2var", alternative="greater", level=0.99)
```

```
## Warning in cci(alpha * 2): 样本的位置不一样：无法计算置信集, 因此回覆NA
```

```
## 
## 	Ansari-Bradley test
## 
## data:  x and y
## AB = 120, p-value = 0.5163
## alternative hypothesis: true ratio of scales is greater than 1
## 99 percent confidence interval:
##   NA Inf
## sample estimates:
## ratio of scales 
##       0.4929215
```
## 非参数多样本中位数的检验Kruskal-Wallis检验

### 列表形式


```r
source("../hypothesistest.R")
x <- c(2.9, 3.0, 2.5, 2.6, 3.2)
y <- c(3.8, 2.7, 4.0, 2.4)
z <- c(2.8, 3.4, 3.7, 2.2, 2.0)
x <- list(x,y,z)
res <- hypothesistest(x, test.type = "Kruskal-wallis-ranksum")
```

```
## Warning in kruskal.test.default(x, y): 'x' is a list, so ignoring argument 'g'
```

```
## 
## 	Kruskal-Wallis rank sum test
## 
## data:  x
## Kruskal-Wallis chi-squared = 0.77143, df = 2, p-value = 0.68
```


### 公式分组


```r
source("../hypothesistest.R")
res <- hypothesistest(Ozone ~ Month, airquality, test.type = "Kruskal-wallis-ranksum")
```

```
## 
## 	Kruskal-Wallis rank sum test
## 
## data:  Ozone by Month
## Kruskal-Wallis chi-squared = 29.267, df = 4, p-value = 6.901e-06
```
## 时间序列白噪声检验Box-Pierce检验


```r
source("../hypothesistest.R")
x <- rnorm(100)
res <- hypothesistest(x, test.type = "Box-Pierce", param.list = list(lag=2))
```

```
## 
## 	Box-Pierce test
## 
## data:  x
## X-squared = 3.9307, df = 2, p-value = 0.1401
```

## 时间序列白噪声检验Ljung-Box检验


```r
source("../hypothesistest.R")
x <- rnorm(100)
res <- hypothesistest(x, test.type = "Ljung-Box", param.list = list(lag=2))
```

```
## 
## 	Box-Ljung test
## 
## data:  x
## X-squared = 2.0649, df = 2, p-value = 0.3561
```

## 非参数无重复因素的方差分析

### 矩阵形式


```r
source("../hypothesistest.R")
RoundingTimes <- matrix(
  c(
    5.40, 5.50, 5.55,
       5.85, 5.70, 5.75,
       5.20, 5.60, 5.50,
       5.55, 5.50, 5.40,
       5.90, 5.85, 5.70,
       5.45, 5.55, 5.60,
       5.40, 5.40, 5.35,
       5.45, 5.50, 5.35,
       5.25, 5.15, 5.00,
       5.85, 5.80, 5.70,
       5.25, 5.20, 5.10,
       5.65, 5.55, 5.45,
       5.60, 5.35, 5.45,
       5.05, 5.00, 4.95,
       5.50, 5.50, 5.40,
       5.45, 5.55, 5.50,
       5.55, 5.55, 5.35,
       5.45, 5.50, 5.55,
       5.50, 5.45, 5.25,
       5.65, 5.60, 5.40,
       5.70, 5.65, 5.55,
       6.30, 6.30, 6.25),
     nrow = 22,
     byrow = TRUE,
     dimnames = list(1 : 22, c("Round Out", "Narrow Angle", "Wide Angle")))
res <- hypothesistest(RoundingTimes, test.type = "friedman-ranksum")
```

```
## 
## 	Friedman rank sum test
## 
## data:  x
## Friedman chi-squared = 11.143, df = 2, p-value = 0.003805
```

### 公式分组


```r
source("../hypothesistest.R")
RoundingTimes <- matrix(
  c(
    5.40, 5.50, 5.55,
       5.85, 5.70, 5.75,
       5.20, 5.60, 5.50,
       5.55, 5.50, 5.40,
       5.90, 5.85, 5.70,
       5.45, 5.55, 5.60,
       5.40, 5.40, 5.35,
       5.45, 5.50, 5.35,
       5.25, 5.15, 5.00,
       5.85, 5.80, 5.70,
       5.25, 5.20, 5.10,
       5.65, 5.55, 5.45,
       5.60, 5.35, 5.45,
       5.05, 5.00, 4.95,
       5.50, 5.50, 5.40,
       5.45, 5.55, 5.50,
       5.55, 5.55, 5.35,
       5.45, 5.50, 5.55,
       5.50, 5.45, 5.25,
       5.65, 5.60, 5.40,
       5.70, 5.65, 5.55,
       6.30, 6.30, 6.25),
     nrow = 22,
     byrow = TRUE,
     dimnames = list(1 : 22, c("Round Out", "Narrow Angle", "Wide Angle")))
wb <- aggregate(warpbreaks$breaks, by = list(w = warpbreaks$wool, t = warpbreaks$tension), FUN = mean)
print(wb)
```

```
##   w t        x
## 1 A L 44.55556
## 2 B L 28.22222
## 3 A M 24.00000
## 4 B M 28.77778
## 5 A H 24.55556
## 6 B H 18.77778
```

```r
res <- hypothesistest(x~w|t, wb, test.type = "friedman-ranksum")
```

```
## 
## 	Friedman rank sum test
## 
## data:  x and w and t
## Friedman chi-squared = 0.33333, df = 1, p-value = 0.5637
```

