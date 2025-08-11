function yt-v --wraps='yt-dlp -f "bv[ext=mp4][height<=420]+ba[ext=m4a]/b[height<=420][ext=mp4]/b[height<=420]" --sponsorblock-remove default --embed-metadata --embed-subs --sub-langs "en.*" -o "%(uploader)s - %(title)s.%(ext)s"' --description 'Download a youtube video'
  yt-dlp -f "bv[ext=mp4][height<=420]+ba[ext=m4a]/b[height<=420][ext=mp4]/b[height<=420]" --sponsorblock-remove default --embed-metadata --embed-subs --embed-thumbnail --sub-langs "en.*" -o "%(uploader)s - %(title)s.%(ext)s" $argv
        
end
