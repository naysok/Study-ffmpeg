# README.md  


### index  

- video → images  
- images → mp4   
- images → gif  


---  

---  


### video → images  


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


---  


### Ref.  

[https://ffmpeg.org/ffmpeg.html](https://ffmpeg.org/ffmpeg.html)  



