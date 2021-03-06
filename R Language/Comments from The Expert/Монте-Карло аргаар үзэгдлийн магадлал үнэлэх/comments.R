
## -------------------------------------------------------------------
## Квадратаас таамгаар сонгосон цэг тус квадратад багтсан дугуйд
## харьяалагдаж байх магадлалыг Монте-Карло аргаар бодсон нь
##
## жинхэнэ магадлал pi/4 буюу ойролцоогоор 0.7853982
## -------------------------------------------------------------------

## 1000 ширхэг санамсаргүй цэг үүсгэж байна

x = runif(1000)
y = runif(1000)

## дугуй дотор байх үзэгдлийн давтамж тооцох хувьсагч

na = 0

## туршилтын тоо (энэ мөрийг кодын эхэнд бичээд дараа нь энд байгаа
## бүх 1000-ийг n-ээр соливол зүйтэй)

n = 1000

## туршилт

for (i in 1:1000) {
  if (x[i]^2 + y[i]^2 <= 1) { ## дугуйд унаж буй эсэх
    na = na + 1               ## дугуйд унах үзэгдлийн давтамж
  }
}

## магадлалын үнэлэлт буюу үзэгдлийн харьцангуй давтамж

na / n

## -------------------------------------------------------------------
## "Уран" буюу товч, оновчтой бичилт
## -------------------------------------------------------------------

X <- matrix(data = runif(n = 2 * {n <- 1000}), ncol = 2, byrow = TRUE)
sum(apply(X = X, MARGIN = 1, FUN = function (x) sum(x ** 2) <= 1)) / n