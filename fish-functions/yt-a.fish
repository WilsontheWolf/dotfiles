function yt-a --wraps='yt-dlp -f "ba[ext=m4a]" --sponsorblock-remove default' --description Download\ a\ youtube\ video\'s\ audio
  yt-dlp -f "ba[ext=m4a]" --sponsorblock-remove default $argv
        
end
