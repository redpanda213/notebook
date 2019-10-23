

scrapy

```
1\
pip install scrapy
2\
D:\scrapy_project>scrapy startproject test1
3\
D:\scrapy_project\test1>scrapy genspider example example.com

```

![1571713790281](D:\笔记\python\douban.png)

```python
import requests
class DoubanSpider(scrapy.Spider):
        name = 'douban'
        start_urls = ['https://movie']
        
        def parse(self,response):
            abstract = respose.xpath('').extract()
            detail_pages = respose.xpath().extract()
            for ind,detail_page in enumerate(detail_pages):
                abstract_detail = abstract[ind]
                yield scrapy.Request(detail_name,callback=self.parse_detail,meta=('abstract_detail'))
            next_page=response.xpath('//span[@class="next"]/a/@href').extract_first()
            base_url = 'https://movie.douban.com/top250'
            if next_page:
                yield scrapy.Request(url=base_url+next_page,callback=self.parse)
        
        def parse_detail(self,response):
            score = response.xpath('//*@class="li rating_num"]/text()').extract_first()
            abstract_detail = response.meta['abstract_detail']
            print(abstract_detail,score)
                
```

