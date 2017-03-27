install.packages('rvest')
library(rvest)

ptt_movie = 'https://www.ptt.cc/bbs/movie/index'
html_tail = '.html'
pages = seq(from=1, to=1000, by=2)

for(page in pages) {
  
  url <-paste0(ptt_movie, toString(page), '.html')
  
  posts<-read_html(url)%>%html_nodes('.r-ent')
  
  for (post in posts) {
    
    author <- post%>%html_nodes('.author')%>%html_text()
    title  <- post%>%html_nodes('.title a')%>%html_text()
    number <- post%>%html_nodes('.nrec span')%>%html_text()
    
    
  }
}

