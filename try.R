#(ENGLISH)
#This code is creating a dose-response model using the drm() function from the "drc" package.
#The drm() function is used to model relationships between a response variable (conc) 
#and one or more independent variables (dead) from data (dados).
#(PT-BR)
#Esse código está criando um modelo de dose-resposta usando a função drm() do pacote "drc".
#A função drm() é usada para modelar relações entre uma variável de resposta (conc) e 
#uma ou mais variáveis independentes (dead) a partir de dados (dados).
#

install.packages("drc")

library(drc)

#(ENGLISH)
#To import a CSV file in R, you can use the read.csv() function. 
#Here is an example of how to import a file called "dados.csv" into a variable called "dados":
#(PT-BR)
#Para importar um arquivo CSV no R, você pode usar a função read.csv().
#Aqui está um exemplo de como importar um arquivo chamado "dados.csv" para uma variável chamada "dados":

dados <- read.csv("dados.csv")

#Esse código está criando um modelo de dose-resposta usando a função drm() do pacote "drc". 
#A função drm() é usada para modelar relações entre uma variável de resposta (conc) e 
#uma ou mais variáveis independentes (dead) a partir de dados (dados).
#A função drm() está especificando que o modelo deve ser ajustado usando a função de dose-resposta "LL.4"
#(limite de detecção) e os nomes das curvas de dose-resposta são "Slope", "Lower Limit", "Upper Limit" e "dados".

dados.m1 <- drm(conc ~ dead, data = dados, fct = LL.4 (names = c("Slope", "Lower Limit", "Upper Limit", "dados")))

summary(dados.m1)

#A função drm() é usada para modelar relações entre uma variável de resposta (dead) e
#uma ou mais variáveis independentes (conc) a partir de dados (dados).
#A função drm() está especificando que o modelo deve ser ajustado usando a função de dose-resposta "LL.2"
# (limite de detecção) sem especificar os nomes das curvas de dose-resposta.

drm(formula = dead ~ conc, data = dados, fct = LL.2())

mod <- drm(dead ~ conc, data = dados, fct = LL.2())

ED(mod, 50, interval = "delta")

plot(mod,type="all", ylab = "death rate",xlab = "toxicidade")