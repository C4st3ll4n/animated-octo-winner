base = read.csv('credit_data.csv')

base$clientid = NULL

summary(base)

invalid_age = base[base$age<0 | is.na(base$age), ]
#base$age = NULL

valid_age = base[base$age > 0 & !is.na(base$age), ]
base = base[base$age > 0, ]

fixed_age = ifelse(base$age < 0 | is.na(base$age),mean(valid_age$age, na.rm = TRUE), base$age ) 
mean(fixed_age, na.rm=TRUE)

base$age = fixed_age

base[is.na(base$age),]

base_scale = base[,1:3]
base_scaled = scale(base_scale)

base[,1:3] = base_scaled
