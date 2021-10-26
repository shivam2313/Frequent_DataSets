market = read.csv('marketing_revised.data')

nrow(market) # number of rows
ncol(market) # number of columns 
sum(!complete.cases(market)) # rows contain NA 
str(market) # data structure

market$income = factor(market$income)
levels(market$income) = c('<20,000','20,000-40,000','>40,000')

market$sex = factor(market$sex) 
levels(market$sex) = c('male','female','other')

market$marital = factor(market$marital)
levels(market$marital) = c('married','single','other_marital')

market$age = factor(market$age) 
levels(market$age) = c('<34','35-54','>55')

market$education = factor(market$education) 
levels(market$education) = c('high','college','graduate')

library(arules)
market = market[complete.cases(market),]
market = as(market,'transactions')
Rules = apriori(market, parameter = list(support = 0.2, confidence = 0.65, target = 'rules'))
inspect(Rules)