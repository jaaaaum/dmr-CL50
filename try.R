#(ENGLISH)
#This code is creating a dose-response model using the drm()
#function from the "drc" package.
#The drm() function is used to model relationships between
#a response variable (conc) and one or more independent variables
#(dead)from data (dados).
#(PT-BR)
#Esse código está criando um modelo de dose-resposta usando a função drm()
#do pacote "drc". A função drm() é usada para modelar relações entre uma
#variável de resposta (conc) e uma ou mais variáveis independentes (dead)
# a partir de dados (dados).
#
#pacote "dcr".
install.packages("drc")
#pacote "dcr".
library(drc)
#
#(ENGLISH)
#To import a CSV file in R, you can use the read.csv() function
#Here is an example of how to import a file called "dados.csv"
#into a variable called "dados":
#(PT-BR)
#Para importar um arquivo CSV no R, você pode usar a função read.csv().
#Aqui está um exemplo de como importar um arquivo chamado "dados.csv"
#para uma variável chamada "dados":

dados <- read.csv("dados.csv")

#Esse código está criando um modelo de dose-resposta usando a função drm()
#do pacote "drc".
#A função drm() é usada para modelar relações entre uma variável de
#resposta (conc) e uma ou mais variáveis independentes (dead)
#a partir de dados (dados).
#A função drm() está especificando que o modelo deve ser ajustado usando a
#função de dose-resposta "LL.4"(limite de detecção) e os nomes das curvas de
#dose-resposta são "Slope", "Lower Limit", "Upper Limit" e "dados".

dados_m1 <- drm(conc ~ dead, data = dados, fct = LL.4(names =
c("Slope", "Lower Limit", "Upper Limit", "dados")))

summary(dados_m1)

#(PT-BR)
#A função drm() é usada para modelar relações entre uma variável de resposta
#(dead) e uma ou mais variáveis independentes (conc) a partir de dados (dados).
#A função drm() está especificando que o modelo deve ser ajustado usando a
#função de dose-resposta "LL.2" (limite de detecção) sem especificar os nomes
#das curvasde dose-resposta.
#A linha de código é chamando uma função de análise de sobrevivência
#(survival analysis) no R chamada "drm()".
#Essa função é usada para modelar dados de sobrevivência, ou seja,
#dados que medem o tempo até que um evento ocorra (como mortalidade).
#A fórmula especificada na função "drm()" é "dead ~ conc",
#o que significa que a variável dependente (dead) é modelada como uma função
#da variável independente (conc). Isso significa que a função "drm()"
#está tentando encontrar uma relação entre a variável
#"dead" (provavelmente uma medida de mortalidade) e a
#variável "conc" (provavelmente uma medida de concentração de algum fator).
#A função "fct = LL.2()" é usada para especificar a função de distribuição de
#sobrevivência que será usada no modelo. No caso, está sendo usada a "LL.2()"
#que é um modelo de sobrevivência de Weibull.
#Os dados são passados através do parametro "data = dados"
#(ENGLISH)
#The code is calling the drm();
#function to fit a parametric survival model to the data in the "dados"
#dataframe.
#The "dead" variable is the response variable and "conc"
#is the independent variable.
#The "~" symbol in the formula specifies that the "dead"
#variable is modeled as a function of the "conc" variable.
#The "fct = LL.2()" argument specifies that a Weibull distribution
#should be used to model the survival data.
#The result of the function is stored in the "mod" object,
#which can be used to make predictions,
#extract model coefficients, and other tasks.

drm(formula = dead ~ conc, data = dados, fct = LL.2())


#The code is calling the drm() function to fit a
#parametric survival model to the data in the "dados" dataframe.
#The "dead" variable is the response variable and
#"conc" is the independent variable.
#The "~" symbol in the formula specifies that the "dead"
#variable is modeled as a function of the "conc" variable.
#The "fct = LL.2()" argument specifies that a Weibull distribution should be
#used to model the survival data. The result of the function is stored in
#the "mod" object, which can be used to make predictions, extract model
#coefficients, and other tasks.

mod <- drm(dead ~ conc, data = dados, fct = LL.2())

#The code you provided calls the ED() function in R,
#which is used to calculate the expected number of events (deaths)
#at a given time point or dose level, based on a previously fit survival model.
#The first argument of the function is the model object (mod) which was created
#by the drm() function in your previous command.
#The second argument is the time point or dose level (50) at which the expected
#number of events is to be calculated. The "interval = 'delta'" argument is
#used to specify that the time point should be interpreted as a fixed time
#interval (delta) rather than as a specific date or clock time.
#The result of the function will be the expected number of deaths at 50 units of
#the "conc" variable, based on the model stored in the "mod" object.

ED(mod, 50, interval = "delta")

#The code is calling the plot() function in R to generate a plot of
#the survival model stored in the "mod" object. The "type = 'all'" argument
#specifies that all types of plots should be generated, which typically includes
#a hazard rate plot, cumulative hazard plot, and survival probability plot.
#The "ylab = 'death rate'" and "xlab = 'toxicidade'" arguments specify the
#labels for the y-axis and x-axis, respectively. The x-axis will
#represent the "toxicity" of the "conc" variable and the y-axis will
#represent the #death rate. The plot will show the relationship between the
#"conc" variable and the death rate, as estimated by the model stored in the
#"mod" object. This plot will help to visualize the relationship between "conc"
#and death rate and also to understand how the toxicidade affects the death rate
#according to the model.

plot(mod, type = "all", ylab = "death rate", xlab = "toxicidade")
