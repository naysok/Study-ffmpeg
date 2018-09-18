# README.md  


### index  

- video → images  
- images → mp4   
- images → gif  


---  

---  


### video → images  

```bash
ffmpeg -ss 10 -t 5 -r 1 -i movie.mp4 image%d.jpg

// 高品質
ffmpeg -i movie.mp4 -ss 10 -t 5 -r 1 -qmin1 -q 1 image%d.jpg
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


##### ref.

ffmpegで動画から静止画を切り出す（バッカムブログ）  
[http://backham.me/blog/2017/02/20/ffmpeg%E3%81%A7%E5%8B%95%E7%94%BB%E3%81%8B%E3%82%89%E9%9D%99%E6%AD%A2%E7%94%BB%E3%82%92%E5%88%87%E3%82%8A%E5%87%BA%E3%81%99/](http://backham.me/blog/2017/02/20/ffmpeg%E3%81%A7%E5%8B%95%E7%94%BB%E3%81%8B%E3%82%89%E9%9D%99%E6%AD%A2%E7%94%BB%E3%82%92%E5%88%87%E3%82%8A%E5%87%BA%E3%81%99/)

FFmpeg コマンドメモ（Qiita）  
[https://qiita.com/rockhopper/items/67a28e575139ecf5bff0](https://qiita.com/rockhopper/items/67a28e575139ecf5bff0)


---  


### images → mp4  

```bash
ffmpeg -framerate 15 -start_number 361 -i %05d.png -r 30 -an -vcodec libx264 -pix_fmt yuv420p out1.mp4
```


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



