#data structure
# vector : same mode
# matrix, array : same mode
# data.frame :various modes(컬럼별)
# List:various modes

#vector basic
#length()
#is.vector()
#as.vector()
rep(2,3) #반복 생성
rep(c(2,4), each = 2)

seq(0,1,length = 11)
seq(1,9,by = 2)

x<-11:20
x[5] <- 99
x[1:4]
x[c(1,3,5)]
x>15
#r은 역으로 인덱스에 접근 가능하다 :which()
which(x>15)

#matrix basic
y <- matrix(1:20,nrow=5,ncol = 4)
dim(y) #행렬의 차원함수수
t(y) #행렬의 전치함수수
apply(y,1,mean)#1= 행, 2 = 열
which(y>10,arr.ind=TRUE) #arr.ind = 행/열의 형태태

#index:names(),rownames(),colnames()
x<-seq(10,40,length=4)
names(x) <-c("A","B","C","D")
x

#matrix binding:실제 인자 행렬을 건드리지 않음
mat<-matrix(1:20, nrow = 4)
cbind(mat, c(21:24))
rbind(mat,c(21:25))

#factor()
bloodType<-c('A','B','O','AB')
summary(bloodType)
bloodType<-factor(bloodType)
summary(bloodType)

#data.frame()
weight<-c(50,60,45,55,70)
height<-c(160,170,158,165,180)
gender<-c('W','W','W','W','M')

data<-data.frame(weight, height,gender)#dataframe형성
data

data<-data.frame(w=weight, h=height,g=gender) #컬럼지정가능
data
rownames(data)<-c("p1","p2","p3","p4","p5")
data
is.factor(data$g) #data.frame()은 character형태 변수들을 자동으로 factor화
str(data) #structure함수를 통해서 변수 형태

data[data$w >= 60,]
data[data$w >=55 & data$g =='W',]

#LIST
list_ex <-list(1:10, c('a','b','c'), matrix(1:4,nrow=2))
list_ex
names(list_ex) <-c("number","alpha","matrix")
list_ex <-append(list_ex, list(gender=c("M","F"))) #새로운 원소 추가
list_ex$gender <- NULL #원소 제거거
list_ex

#결측치 처리
ages<-c(48,78,56,-999)
ages[ages==-999] <- NA
is.na(ages)
sum(is.na(ages))
sum(ages) #sum,mean등을 포함한 기본연산들 모두 na처리됨
?sum #함수 도움말
sum(ages,na.rm = TRUE) #na.rm결측치 무시

#데이터 품질 관리 is.na()와 rowsums활용
mat<-matrix(1:50,nrow=5)
mat[1,1] <- NA; mat[1,3]<-NA
mat[2,2:7]<-NA; mat[4,3]<-NA
mat
mat[rowSums(is.na(mat))/dim(mat)[2]<=0.1,]

#파일 입출력
getwd()
setwd("C:/Users/gram15/Desktop/2020-2데이터문제해결및실습/sample1") #새로운 working directory지정
getwd()

mydata<-read.table("Data/BND.csv",header=TRUE,sep=",")
mydata
bnd<-read.table("Data/BND.csv", header=TRUE, sep=",", col.names=c("PtID","Birthyear","DTHYear","COD1","COD2"))
head(bnd)
bnd6<-head(mydata)
gender<-c("M","F","M","M","F","F")
bnd6<-cbind(bnd6,gender)
write.table(bnd6,file="bnd6.csv",sep=",",quote=FALSE,row.names=FALSE)

#보조 데이터 함수
ls() #현재 오브젝트들을 리스팅
b<-data.frame(id=c(1,2,3),value=c("a","b","c"))
value
attach(b) #같은 이름인 경우 나중에 attach한 이름만 접근 가능, $연산자 생략가능
value
#library() #package를 attach하는 기능
search() #attach된 패키지명,변수 모두 등장
searchpaths()#패키지 경로 확인
detach(b) #attach된 함수 제거
rm(b) #오브젝트 제거
#is. () : 검사 as.() :변환

#문자함수
letters[1:5]
LETTERS[1:5]
x<-c("normal_1","normal_2","cancer_1","cancer_2")
length(x)
nchar(x[1])
toupper(x[1]) #대문자로
tolower(x[1]) #소문자로로
substr(x, 1,6) #부분 문자열 추출 (시작위치, 종료위치치)
grep("normal",x,ignore.case=TRUE) 

#중첩 조건문/반복문
# if(){
#   code1
# }else if(){
#   code2
# }else{
#   code3
# }
# 
# for(i in 2:9){
#   code1
#   for(j in 1:10){
#     code2
#   }
# }


#사용자함수
mymean<-function(x){
 my.mean<-mean(x)
 return(my.mean)
}
a<-c(1:4)
mymean(a)

#subset(df, 조건, ...,select=c("컬럼1","컬럼2",...))
#transform(df, 컬럼이름=변수, 컬럼이름=변수)
#order() : rank에 따른 색인값 반환
#sort(,decreasing=TRUE) : 정렬하여 결과 반환
#order(patients$ages, -patients$height)
#patients[order(patients$ages,-patients$height),] 정렬된 dataframe반환
#aggregate(피적용 컬럼, by=list(컬럽1, 컬럼2,...), 적용할 함수)
#aggregate(list(meanweight = patients$weight), by=list(agegroups = patients$ages), mean)
#merge(df1,df2,by=c(""),all=FALSE, all.x = all, all.y = all, ...) all=FALSE:inner join, all.x=TRUE : left join, all.y=TRUE:right join
