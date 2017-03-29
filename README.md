長庚大學 大數據分析方法 作業三
================

網站資料爬取
------------

``` r
#這是R Code Chunk
library(rvest) ##第一次使用要先安裝 install.packages("rvest")
```

    ## Warning: package 'rvest' was built under R version 3.2.5

    ## Loading required package: xml2

    ## Warning: package 'xml2' was built under R version 3.2.5

``` r
ptt_movie = 'https://www.ptt.cc/bbs/movie/index'
html_tail = '.html'
pages = seq(from=1, to=1000, by=2)

authors <- c() 
titles  <- c()
numbers <- c()

for(page in pages[1:10]) {
  
  url <-paste0(ptt_movie, toString(page), '.html')
  
  posts<-read_html(url)%>%html_nodes('.r-ent')
  
  for (post in posts) {
    
    author <- post%>%html_nodes('.author')%>%html_text()
    title  <- post%>%html_nodes('.title a')%>%html_text()
    number <- post%>%html_nodes('.nrec span')%>%html_text()
    
    if (identical(number, character(0))) {
      numbers <- c(numbers, '0')
    } else {
      numbers <- c(numbers, number)
    }
    
    authors <- c(authors, author)
    titles  <- c(titles, title)
    
    
  }
}

data_output <- data.frame(Authors=authors, Titles=titles, Numbers=numbers)
```

爬蟲結果呈現
------------

``` r
#這是R Code Chunk
knitr::kable(data_output) ##請將iris取代為上個步驟中產生的爬蟲資料資料框
```

| Authors      | Titles                                                      | Numbers |
|:-------------|:------------------------------------------------------------|:--------|
| IamJean      | \[討論\] 夏日童年--四眼田雞麥諾利多                         | 27      |
| demona.      | \[知識\] 我又再看神鬼傳奇1了                                | 67      |
| nin64        | \[心得\] 昨天東森演的鬼上門                                 | 2       |
| cyrille      | \[心得\] 三部曲之鬥法                                       | 3       |
| Comer.       | \[心得\] 看完《女神陷阱》的碎碎唸..........                 | 5       |
| getlaw.      | \[心得\] 情路長短調…有劇情                                  | 1       |
| bohemia.     | \[轉貼\] alice看~「摩登」時代                               | 3       |
| totoroJack   | \[感想\] 紅色,瘋狂,縱火的原點:Point of Origi …              | 2       |
| loiter       | Re: \[心得\] 藍色協奏曲                                     | 1       |
| Jolynn       | \[心得\] 我看<藍色協奏曲>                                   | 4       |
| cavinlai     | \[心得\] 第凡內早餐                                         | 2       |
| firewalker   | \[心得\] Dark Fury: 星際傳奇跟超世紀戰警間遺 …              | 0       |
| bushman      | \[心得\] Movie~魔女嘉麗--無法擺脫的校園悲劇                 | 0       |
| TulipChiu    | \[情報\] "Flamenco" by Carlos Saura                         | 1       |
| yoyo9269     | \[心得\] 終極追殺令~~                                       | 6       |
| A1an         | \[情報\] 關於異形的小常識                                   | 12      |
| bbc          | \[閒聊\] 終極戰士也是會進步的                               | 5       |
| shinada      | \[心得\] 剛看了大蟒蛇血蘭花                                 | 16      |
| yoyo9269     | \[心得\] 決戰時刻~~                                         | 9       |
| EvilBunny    | Re:\[心得\] 美國殺人魔結局                                  | 6       |
| firewalker   | \[心得\] Wonder Boys：幽默聰明的劇本，精采的 …              | 1       |
| cavinlai     | \[心得\] 終極酷斯拉                                         | 7       |
| molon        | Re: \[討論\] 在雙眼的縫隙之間                               | 1       |
| Mansun       | \[影評\] DVD -Scary Movie 3<驚聲尖笑3>                      | 3       |
| firewalker   | \[影評\]《綠寶石》八○年代的浪漫冒險代表作                   | 0       |
| firewalker   | \[影評\]《尼羅河寶石》走向不同的續集                        | 0       |
| filmwalker   | \[影評\] 走進奇探心魔如入迷宮                               | 0       |
| cavinlai     | \[心得\] 這個男人有點色                                     | 1       |
| totoroJack   | \[心得\] 一吻可否化鴻溝:蘇格蘭之吻(Ae Fond K …              | 2       |
| gless        | \[情報\] 英國影迷票選史上最遜的電影對白！                   | 14      |
| firewalker   | \[心得\]【戰略高手】- Soderbergh 最酷的電影                 | 3       |
| holf         | \[心得\] 我心目中2004下半年十大佳片                         | 14      |
| gonghang     | \[影評\] 異形系列                                           | 6       |
| holf         | \[心得\] 2004年令我失望的十大電影                           | 22      |
| soga         | Re: \[閒聊\] 十大禁片                                       | 10      |
| fansss       | \[影評\]《極幻迷樂之旅》與心碎的聲音                        | 0       |
| cavinlai     | \[心得\] 紅色情深                                           | 3       |
| totoroJack   | \[感想\] 最強,新潮流,天下第一劍:名劍(the Sword)             | 0       |
| sunline      | \[心得\]《樂士浮生錄2‧名揚四海》                            | 3       |
| cavinlai     | \[心得\] 白色情迷                                           | 1       |
| libraryfay   | \[心得\] 謎中謎 Charade                                     | 3       |
| totoroJack   | \[感想\] Swing with Swing girls!                            | 6       |
| jimulder     | \[影評\] 不負責任影評：《Swing Girls》                      | 0       |
| ycycv        | \[心得\] 水瓶座女孩 (含劇情)                                | 6       |
| autorad      | Re: \[問題\] 教父2 為什麼麥可要把哥哥佛雷多殺了呢           | 8       |
| Muhchyng     | \[心得\] 希臘左巴（雷）                                     | 2       |
| smilelamb    | Re: \[問題\] 教父2 為什麼麥可要把哥哥佛雷多殺了呢           | 6       |
| Nekoi        | \[心得\] 夢幻天堂 (內有劇情)                                | 5       |
| hu236        | \[情報\] 台灣與大陸的電影翻譯名稱比較                       | 29      |
| Mansun       | \[影評\] 黑人解救政府血淚史-<限制級戰警2>                   | 3       |
| justmyway    | Re: \[心得\] Love the hard way!（有劇情喔)                  | 5       |
| filmwalker   | \[影評\] 遇見莉莉 從遵從到反叛的試探                        | 0       |
| Stormy       | Re: \[影評\] 限制級戰警2                                    | 2       |
| lovefriends  | \[心得\] 當哈利碰上莎莉 When Harry Met Sally                | 2       |
| totoroJack   | \[感想\] 低級,屎尿,我愛大美國:美國特警隊(Tea …              | 0       |
| filmwalker   | \[影評\]《星際大戰第三部曲：西斯大帝的復仇》                | 2       |
| jimulder     | \[影評\] 不負責任影評：《星際大戰3西斯大帝的復仇》          | 4       |
| filmwalker   | \[專題\] 星戰電影課前溫習                                   | 5       |
| Stormy       | \[ 雷 \] 帝國降臨：星戰三部曲                               | 5       |
| a00000000926 | \[心得\] 關於星戰三的一點心得                               | 3       |
| shodagu      | Re: \[問題\] 請問愛神這部片                                 | 5       |
| EVA96        | \[影評\] 新空房禁地─彼得傑克森極致的表現                    | 8       |
| filmwalker   | \[影評\]《星際大奇航》 文/阿偉                              | 3       |
| EVA96        | \[推薦\] 強殖入侵─這什麼鬼片名？                            | 7       |
| firewalker   | \[影評\] 奇幻影集【Hercules】–Xena 的前身                   | 2       |
| Herreweghe   | \[影評\] Strip Search- A HBO Original Film                  | 1       |
| Herreweghe   | \[影評\] Normal-A HBO Original Movie                        | 1       |
| EVA96        | \[心得\] 盧貝松─終極追殺令 Leon                             | 8       |
| md1011       | \[心得\] 就是挺Michael Bay!                                 | 20      |
| JuliaFerrari | \[推薦\] 沉默的傷痛                                         | 3       |
| FlyinDeath   | \[有雷\] 超好看的緊急動員(The Siege)                        | 5       |
| filmwalker   | \[影評\]「陪我走到世界盡頭」造就２個影帝                    | 0       |
| Muhchyng     | \[心得\] 有你我不怕（雷）                                   | 3       |
| coolcate     | Re: \[問題\] 魔戒3和英雄本色 ??                             | 5       |
| Atica        | Re: \[問題\] 墨西哥情人                                     | 1       |
| cavinlai     | \[心得\] 羅馬假期                                           | 1       |
| une2         | Re: \[問題\] 請問七矮人（有地雷）                           | 2       |
| colatea      | Re: \[問題\] 請問七矮人（有地雷）                           | 0       |
| jazzstanley  | Re: \[心得\] 上錯驚魂路                                     | 5       |
| firefoxYU    | \[心得\] ID4星際終結者所表達的自由觀 有雷                   | 10      |
| eflin        | \[影評\] 企鵝寶貝─無國界的感動                              | 0       |
| eflin        | \[影評\] 星際大奇航──最大的諷刺是人類的理所 …               | 0       |
| jasjang      | \[心得\] 未來總動員                                         | 4       |
| brilliancy   | \[心得\] It's all Gone Pete Tong                            | 1       |
| tazotea      | Re: \[問題\] 海海人生                                       | 0       |
| Stormy       | \[影評\] 隱劍鬼爪：恬靜的情愛散文                           | 1       |
| FLYNIGHT     | \[心得\] 撼動生命(雷)                                       | 1       |
| quiff        | \[心得\] 走過捷克歷史，《甜蜜布拉格》終回現代               | 0       |
| miyaw        | \[心得\] 撼動生命（有雷）                                   | 1       |
| getlaw       | \[心得\] 女人不壞，男人不愛                                 | 1       |
| cyla         | \[心得\] 鬼紅鞋                                             | 0       |
| dlrow        | \[影評\] 鬼嚇8 差強人意觀後感 (有雷喔)                      | 1       |
| pobea        | \[心得\] 鬼嚇8-(有大地雷)看過可以進來討論\_                 | 4       |
| firewalker   | \[影評\] ３６總局–沒有絕對善惡的警界                        | 2       |
| zhiyue       | \[心得\] 烏龜也會飛 (內有劇情)                              | 3       |
| filmwalker   | \[影評\]「英雄教育」刻畫青春純淨的叛逆                      | 0       |
| zhiyue       | \[心得\] 在世界中心呼喊愛情                                 | 2       |
| xhoward      | Re: \[心得\] 推薦"愛狗男人請來電"(沒有劇情)                 | 3       |
| northcloud   | \[心得\] 英雄教育 (有雷)                                    | 3       |
| DonaldDuck   | Re: \[請益\] 怒海潛將是真的嗎?                              | 5       |
| freer        | \[心得\] 英雄教育雜記--後半有劇情                           | 8       |
| jcewky       | \[心得\] 民族誌影展                                         | 1       |
| Stormy       | \[影評\] 玩命快遞二：愚蠢的坦蕩                             | 1       |
| shred        | \[心得\] 無情荒地有琴天                                     | 4       |
| cavinlai     | \[心得\] 唐人街                                             | 0       |
| fansss       | \[影評\]《我們還剩下什麼》：止不住的淚                      | 0       |
| totoroJack   | \[感想\] 漫長的旅途與追尋愛情的極至:儷人行(Tw …             | 0       |
| quiff        | \[影評\]《生命是個奇蹟》：最荒謬而真實的快感                | 2       |
| artemismoon  | \[心得\] 幸福黃色電影Torremolinos 73                        | 1       |
| Davidgood    | \[心得\] Normal親密風暴:一個變性人的故事--Davidgood옠…      | 2       |
| mercury33    | \[心得\] 命運變奏曲                                         | 4       |
| brilliancy   | \[心得\] 今夜星光燦爛 Himmelfall (英譯Falling …             | 3       |
| Muhchyng     | \[心得\] 大雨大雨一直下                                     | 4       |
| sunguitar    | Re: \[心得\] 命運變奏曲                                     | 1       |
| brilliancy   | \[心得\] 搖滾公路 Menolippu Mombasaan                       | 2       |
| artemismoon  | \[心得\] 破浪而出 Breaking The Waves                        | 0       |
| bright9      | \[心得\] 昨天看了放牛班的春天                               | 9       |
| paulchiou    | \[心得\] 看了大逃殺dvd                                      | 6       |
| artemismoon  | \[心得\] 命運變奏曲 Manderlay                               | 2       |
| shiauM       | Re: \[心得\] 命運變奏曲 Manderlay                           | 1       |
| filmwalker   | \[影評\]《11點14分》 文/王志成                              | 0       |
| rolyne       | \[心得\] 哈利波特觀後感                                     | 4       |
| Mask2        | \[心得\] 火盃的考驗!!!讚!!!                                 | 2       |
| Stormy       | \[影評\] 火盃的考驗：冗長的魔幻文藝                         | 27      |
| imotion      | \[心得\] 建議先看小說再看電影的哈利                         | 3       |
| zhiyue       | \[心得\] 哈利波特-火盃的考驗 (內有劇情)                     | 2       |
| chendeath    | \[有雷\] 哈利波特四 - 火盃的考驗 觀後感                     | 5       |
| david1117    | \[心得\] 哈利波特四 - 火盃的考驗(小雷)                      | 7       |
| Felicite     | \[心得\] 哈利波特四:火盃的考驗                              | 11      |
| stark        | Re: \[問題\] 請問有人看過危機最前線嘛?                      | 4       |
| cody973      | \[心得\] 南方影展 beautiful boxer (小雷)                    | 4       |
| jimulder     | \[影評\] 不負責任影評：《11:14》                            | 0       |
| Stormy       | \[影評\] 烈火終結令：嚴父與英雄的悲歌                       | 5       |
| synge        | \[心得\] 哈利波特 4 觀後感(有雷)                            | 7       |
| s6320373     | \[影評\] 純建議影評---哈利波特4 火盃的考驗 94分             | 12      |
| mouz         | \[心得\] 哈利波特觀後感(雷)                                 | 9       |
| mikumi       | \[心得\] 哈利波特四觀後小心得(有地雷喔)                     | 16      |
| nmrfarm      | \[心得\] 魔界轉生--------(雷聲隆隆的大雷)                   | 9       |
| cavinlai     | \[心得\] 越戰獵鹿人                                         | 3       |
| Stormy       | \[影評\] 魔界轉生：缺陷四起、勉為可觀                       | 3       |
| filmwalker   | \[影評\] 偶然與你相遇 /錢亞東                               | 2       |
| Stormy       | \[影評\] 吉屋出租：當音樂凌駕影像                           | 5       |
| lovefriends  | \[心得\] 最後一擊 Cinderella Man                            | 5       |
| abcdeffg     | \[心得\] 迷走星球                                           | 4       |
| DonaldDuck   | Re: \[討論\] 有關水世界                                     | 1       |
| cyla         | \[影評\] 聞天祥評深入絕地                                   | 0       |
| Stormy       | \[影評\] 風流教師霹靂妹：我們都不完美                       | 3       |
| Agenda       | Re: \[有雷\] 想請問~~最後一次心動~~男主角最後               | 1       |
| yawchun      | Re: \[請益\] 有人有看過　十二怒漢嗎？                       | 2       |
| md1011       | \[心得\] 閃靈戰士 Dog Soldiers                              | 3       |
| Mansun       | \[影評\] DVD - The Longest Yard〈鐵男總動員〉               | 1       |
| Tyler0914    | \[心得\]《迷走星球》───當遊戲不只是遊戲(雷)                 | 1       |
| fic          | \[心得\] 砂中之金：《老爸的朝聖之旅》                       | 0       |
| Cinci        | \[心得\] 迷走星球---小雷                                    | 1       |
| dovelet      | Re: \[問題\] 時時刻刻(小雷)                                 | 1       |
| baubibi      | \[心得\] 愛情不用尋找 (大雷)                                | 2       |
| sisely       | \[心得\] 美女罐 (有雷)                                      | 2       |
| faketony     | \[感想\] 睡人                                               | 7       |
| pastfox      | \[心得\] 納尼亞傳奇                                         | 2       |
| Cacto        | \[心得\] 吉屋出租 RENT (有大雷 慎入)                        | 7       |
| dbeat        | \[有雷\] 納尼亞傳奇觀後感還有板友的問題                     | 4       |
| starred      | \[心得\] 真情電波Radio                                      | 0       |
| weiger       | Re: \[問題\] 有關奪魂鋸2(小雷)                              | 1       |
| Sunni        | \[有雷\] Touch鄰家女孩觀後感                                | 2       |
| growingup    | \[轉貼\] 參與2005高雄電影節工作心得                         | 0       |
| crazybabygal | \[心得\] 納尼亞(小雷)                                       | 7       |
| imotion      | \[心得\] 與小說有些落差的納尼亞                             | 1       |
| quiff        | \[心得\] 孤雛淚：尋找一雙鞋                                 | 0       |
| billgaze     | Re: \[問題\] 奪魂鋸2的劇情<有雷>                            | 0       |
| socrazy      | Re: 電影筆記 大紅燈籠高高掛                                 | 6       |
| vangenlis    | \[心得\] 鬼家怪談(含看完地雷文心得)                         | 3       |
| cavinlai     | \[心得\] 魂斷藍橋                                           | 5       |
| thindust     | \[有雷\] 情癲大聖                                           | 3       |
| firewalker   | \[影評\] 金賽性學博士–連恩尼森大膽演出                      | 3       |
| jimulder     | \[影評\] 不負責任影評：《金賽性學教室》                     | 1       |
| hearteye     | Re: \[心得\] 我對納尼亞很失望                               | 5       |
| filmwalker   | \[轉錄\] 2005 六大影評人會                                  | 12      |
| brilliancy   | \[心得\] 燦爛時光                                           | 5       |
| aizawatenya  | \[討論\] 奪魂鋸二的一點意見(雷)                             | 3       |
| appleheart   | GG                                                          | 2       |
| rollglis     | \[心得\] 霍元甲心得兼評論                                   | 5       |
| Raslin8271   | \[影評\] 霍元甲觀後心得～（大捏）                           | 4       |
| C0USIN       | \[心得\] 霍元甲小心得.小雷                                  | 11      |
| acerty       | \[心得\] 霍元甲(有雷)                                       | 5       |
| samnging     | \[有雷\] 一整個好看的霍元甲                                 | 7       |
| skypiea      | \[心得\] 霍元甲觀後感(雷)                                   | 7       |
| remuslupin   | \[心得\] 個人認為的真‧武俠片《霍元甲》(小雷)                | 3       |
| fauzy        | \[心得\] 霍元甲，值得一看！                                 | 5       |
| asity        | \[心得\] 霍元甲的領悟                                       | 8       |
| ManicD       | \[心得\] 霍元甲─中國崛起的民族主義反省                      | 13      |
| ykkurama     | \[影評\] 霍元甲-一個充滿勇氣的人生(有雷)                    | 8       |
| omoon        | \[心得\] 霍元甲 (裡面雷聲隆隆喔...)                         | 2       |
| ADASHI       | \[心得\] 霍元甲觀後感 (有雷)                                | 3       |
| lalala614    | \[訪問\] 李連傑在北京大學演講全文(更好地理解\[霍元甲\])     | 23      |
| lalala614    | Re: \[訪問\] 李連傑在北京大學演講全文(更好地理解\[霍元甲\]) | 7       |
| firewalker   | \[影評\] 史密斯任務–半動作半喜劇的殺手電影                  | 2       |
| firewalker   | \[影評\] 門當父不對2：親家路窄–原班人馬再造ꬠ…               | 5       |
| firewalker   | \[影評\] 萬惡城市–超炫的視覺先鋒                            | 17      |
| n0say        | Re: \[問題\] 霍元甲中的秦爺帶幾口棺走在街上那段             | 0       |
| thindust     | \[ 雷 \] 遲來的感動 情癲大聖                                | 4       |

解釋爬蟲結果
------------

``` r
#這是R Code Chunk
dim(data_output)
```

    ## [1] 200   3

``` r
nrow(data_output)
```

    ## [1] 200

總共抓了200篇，欄位有3。

``` r
#這是R Code Chunk
sort(table(data_output$Author), decreasing = T)
```

    ## 
    ##   firewalker   filmwalker     cavinlai       Stormy   totoroJack 
    ##           11           10            9            9            6 
    ##   brilliancy     jimulder  artemismoon        EVA96       Mansun 
    ##            4            4            3            3            3 
    ##     Muhchyng        quiff       zhiyue         cyla   DonaldDuck 
    ##            3            3            3            2            2 
    ##        eflin       fansss   Herreweghe         holf      imotion 
    ##            2            2            2            2            2 
    ##    lalala614  lovefriends       md1011     thindust     yoyo9269 
    ##            2            2            2            2            2 
    ## a00000000926         A1an     abcdeffg       acerty       ADASHI 
    ##            1            1            1            1            1 
    ##       Agenda  aizawatenya   appleheart        asity        Atica 
    ##            1            1            1            1            1 
    ##      autorad      baubibi          bbc     billgaze     bohemia. 
    ##            1            1            1            1            1 
    ##      bright9      bushman       C0USIN        Cacto    chendeath 
    ##            1            1            1            1            1 
    ##        Cinci      cody973      colatea       Comer.     coolcate 
    ##            1            1            1            1            1 
    ## crazybabygal      cyrille    david1117    Davidgood        dbeat 
    ##            1            1            1            1            1 
    ##      demona.        dlrow      dovelet    EvilBunny     faketony 
    ##            1            1            1            1            1 
    ##        fauzy     Felicite          fic    firefoxYU   FlyinDeath 
    ##            1            1            1            1            1 
    ##     FLYNIGHT        freer       getlaw      getlaw.        gless 
    ##            1            1            1            1            1 
    ##     gonghang    growingup     hearteye        hu236      IamJean 
    ##            1            1            1            1            1 
    ##      jasjang  jazzstanley       jcewky       Jolynn JuliaFerrari 
    ##            1            1            1            1            1 
    ##    justmyway   libraryfay       loiter       ManicD        Mask2 
    ##            1            1            1            1            1 
    ##    mercury33       mikumi        miyaw        molon         mouz 
    ##            1            1            1            1            1 
    ##        n0say        Nekoi        nin64      nmrfarm   northcloud 
    ##            1            1            1            1            1 
    ##        omoon      pastfox    paulchiou        pobea   Raslin8271 
    ##            1            1            1            1            1 
    ##   remuslupin     rollglis       rolyne     s6320373     samnging 
    ##            1            1            1            1            1 
    ##       shiauM      shinada      shodagu        shred       sisely 
    ##            1            1            1            1            1 
    ##      skypiea    smilelamb      socrazy         soga        stark 
    ##            1            1            1            1            1 
    ##      starred    sunguitar      sunline        Sunni        synge 
    ##            1            1            1            1            1 
    ##      tazotea    TulipChiu    Tyler0914         une2    vangenlis 
    ##            1            1            1            1            1 
    ##       weiger      xhoward      yawchun        ycycv     ykkurama 
    ##            1            1            1            1            1

PO文數的作者為firewalker與filmwalker分別為11篇與10篇。

懶得懶得懶得寫人工結論
