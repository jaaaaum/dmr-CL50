### ANOVA e Teste TuKey
# dados dos analistas

#dados dos analistas
a1 <- c(10.3, 9.8, 11.4)
a2 <- c(9.5, 8.6, 8.9)
a3 <- c(12.1, 13.0, 12.4)
a4 <- c(9.6, 8.3, 8.2)
a5 <- c(11.6, 12.5, 11.4)

dados <- data.frame(a1, a2, a3, a4, a5) # cria um conjunto de dados
dat <- stack(dados) #cria vector no formato pilha

#ANOVA

anova = aov(dat$value~dat$ind) # faz ANOVA
summary(anova) # chama o resultado da anova

# f tabelado
qf(0.95, df1 =4, df2 = 10) #f crítico

# Teste de Tukey
tk_teste <- TukeyHSD(anova)
tk_teste

plot(tk_teste)
boxplot(dados)
