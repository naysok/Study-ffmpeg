# Study-ffmpeg    


オプションを色々つけて ffpmeg をコマンドライン実行しなくても、  
ffmpeg.sh とかに書いて  
```bash
bash ffmpeg.sh
```
でも実行できる  



### Index  

- print info
- video → images  
- images → mp4   
- images → gif  
- mov → mp4  
- video-1 + video-2 → video  
- mp4 → mp3  
- mp3 + mp4  



---  

---  


### print info  

mp4, mp3 どちらでも出る  

```bash
ffmpeg -i File_Name

### ex.
# Duration: 00:00:07.60, start: 0.000000, bitrate: 1102 kb/s
# [SAR 1:1 DAR 1:1], 1098 kb/s, 30 fps, 30 tbr, 15360 tbn, 60 tbc (default)
```


---  

---  


### video → images  

```bash
ffmpeg -ss 10 -t 5 -r 1 -i movie.mp4 image%d.jpg
ffmpeg -r 24 -i 180917.mp4 image%5d.jpg


// 高品質
ffmpeg -i movie.mp4 -ss 10 -t 5 -r 1 -qmin1 -q 1 image%d.jpg
ffmpeg -i 180917.mp4 -ss 0 -r 30 -q 1 image%5d.jpg

```

-ss :開始秒数  
-t :開始秒数からの切り出す秒数  
-r : １秒に切り出す枚数  


動画をフレームごとの連番画像に変換  
```bash
ffmpeg -i /path/to/video -q:v 0 -vf scale=1280:-1 /path/to/image_%05d.jpg
```
-q:v 0: 画質を落とさない  
-vf scale=1280:-1: 画像サイズ変更。 "-1" は等倍  


##### Ref.

ffmpegで動画から静止画を切り出す（バッカムブログ）  
[http://backham.me/blog/2017/02/20/ffmpeg%E3%81%A7%E5%8B%95%E7%94%BB%E3%81%8B%E3%82%89%E9%9D%99%E6%AD%A2%E7%94%BB%E3%82%92%E5%88%87%E3%82%8A%E5%87%BA%E3%81%99/](http://backham.me/blog/2017/02/20/ffmpeg%E3%81%A7%E5%8B%95%E7%94%BB%E3%81%8B%E3%82%89%E9%9D%99%E6%AD%A2%E7%94%BB%E3%82%92%E5%88%87%E3%82%8A%E5%87%BA%E3%81%99/)

FFmpeg コマンドメモ（Qiita）  
[https://qiita.com/rockhopper/items/67a28e575139ecf5bff0](https://qiita.com/rockhopper/items/67a28e575139ecf5bff0)


---  

---  



### images → mp4  

```bash
ffmpeg -framerate 15 -start_number 361 -i %05d.png -r 30 -an -vcodec libx264 -pix_fmt yuv420p out1.mp4
ffmpeg -framerate 30 -start_number 0 -i image%05d.jpg -r 30 -an -vcodec libx264 -pix_fmt yuv420p out1.mp4

```

---  

---  


### images → gif  

```bash
// 早すぎ
ffmpeg -f image2 -r 15 -i 171028-%03d.jpg  out-15.gif
ffmpeg -f image2 -r 15 -i 171028-resize-%03d.jpg  out-resize-15.gif

// ちょうどよいかな
ffmpeg -f image2 -r 8 -i 171028-%03d.jpg  out-8.gif
ffmpeg -f image2 -r 8 -i 171028-resize-%03d.jpg  out-resize-8.gif

ffmpeg -f image2 -r 6 -i 171028-%03d.jpg  out-6.gif
ffmpeg -f image2 -r 6 -i 171028-resize-%03d.jpg  out-resize-6.gif

// 遅すぎ
ffmpeg -f image2 -r 4 -i 171028-%03d.jpg  out-4.gif
ffmpeg -f image2 -r 4 -i 171028-resize-%03d.jpg  out-resize-4.gif
```



##### Ref.  

[https://ffmpeg.org/ffmpeg.html](https://ffmpeg.org/ffmpeg.html)  


---  

---  


### mov → mp4  

.avi ならば、QuickTime で、.mov に変換  


.mov から .mp4 の変換はこれ
```bashz
ffmpeg -i [変換前のファイル名] -pix_fmt yuv420p [変換後のファイル名]
ffmpeg -i in.mov -pix_fmt yuv420p one.mp4

```


##### Ref.  

ffmpegを用いて、.MOVから.mp4に変換する方法  
[https://kakubari-ryusei.hatenablog.com/entry/2017/10/12/153003](https://kakubari-ryusei.hatenablog.com/entry/2017/10/12/153003)


---  

---  


### video-1 + video-2 → video  

ループの .mp4 は、Viemo にあげる時に、30秒程度にしたいので、これで繋ぐ  
```bash
ffmpeg -f concat -i mylist.txt -c copy output.mp4
```

mylist.txt
> file one.mp4  
file one.mp4  
file one.mp4  


##### Ref.  

ffmpegでMP4ファイルを結合する(Qiita)
[https://qiita.com/niusounds/items/c386e02ab8e67030bdc0](https://qiita.com/niusounds/items/c386e02ab8e67030bdc0)


---  

---  


### mp4 → mp3  

```bash
ffmpeg -y -i input.mp4 -ab 128k output.mp3

```


##### Ref  
[http://d.hatena.ne.jp/katz_24/20160324/1458784287](http://d.hatena.ne.jp/katz_24/20160324/1458784287)   


---  

---  


### mp3 + mp4  

```bash
ffmpeg -i Igarashi-Morning-Edge.mp4  -i Igarashi-Morning.mp3 -c:v copy -c:a aac -strict experimental -map 0:v -map 1:a output.mp4
```

##### Ref.  
- FFmpegで動画編集をするガイド  
[http://moriyoshi.hatenablog.com/entry/2015/12/17/224127](http://moriyoshi.hatenablog.com/entry/2015/12/17/224127)  

- [ffmpeg]音声なし動画と音声を結合する  
[https://kobiwa.net/blog/2016/08/11/ffmpeg%E9%9F%B3%E5%A3%B0%E3%81%AA%E3%81%97%E5%8B%95%E7%94%BB%E3%81%A8%E9%9F%B3%E5%A3%B0%E3%82%92%E7%B5%90%E5%90%88%E3%81%99%E3%82%8B/](https://kobiwa.net/blog/2016/08/11/ffmpeg%E9%9F%B3%E5%A3%B0%E3%81%AA%E3%81%97%E5%8B%95%E7%94%BB%E3%81%A8%E9%9F%B3%E5%A3%B0%E3%82%92%E7%B5%90%E5%90%88%E3%81%99%E3%82%8B/)  
