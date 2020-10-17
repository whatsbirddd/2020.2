library(reshapae2)
#wide to long :melt()
melt(pat.wide, )
#long to wide : dcast(,유지할 컬럼 ~ 분해할 컬럼, value.var = 각 셀에 들어갈 값이 있는 컬럼)
dcast(pat.long, Id+sex ~ Treatment, value.var="BloodP")

#package dplyr
getwd()
bnd <- read.table("C:/Users/gram15/Desktop/2020-2데이터문제해결및실습/sample1/Data/BND.csv",header=TRUE, sep=",")

library(dplyr)
library(MASS)

bnd_df <- tbl_df(bnd)#dplyr전용 데이터프레임
bnd_df

birthwt_df<-tbl_df(birthwt)
birthwt_df
#특정컬럼 선택
dplyr::select(birthwt_df, low,age,smoke,bwt)
#특정 컬럼 제외 선택
dplyr::select(birthwt_df )
#low~smoke사이 컬럼 선택

#필터(where)

#정렬(arrange)
arrange(birthwt_df,age,bwt)
arrange(birthwt_df,desc(age),desc(bwt))

#계산된 컬럼
mutate(birthwt_df,bwt_kg = bwt / 1000)

#요약
summarise(birthwt_df, bwt_mean = mean(bwt,na.rm=TRUE),bwt_median)

#R graphics


autos_data<-read.table(header=TRUE, text='cars trucks suvs 
                       + 1 2 4 
                       + 3 5 6 
                       + 6 4 6 
                       + 4 5 6 
                       + 9 12 16 
                       + ')
autos_data
plot(autos_data$cars, type="o")
attach(birthwt)  
tx<-table(smoke, race)
tx
