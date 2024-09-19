function yt-wa --wraps='yt-dlp -f "wa[ext=m4a]" --sponsorblock-remove default' --description Download\ a\ youtube\ video\'s\ worst\ audio
  yt-dlp -f "wa[ext=m4a]" --sponsorblock-remove default $argv
        
end
