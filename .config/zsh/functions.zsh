function util_git_init(){
  git init;
  git add .;
  git commit -m "init";
}

function util_export_readinglist(){
   plutil -convert xml1 -o - ~/Library/Safari/Bookmarks.plist|ruby -rubygems -e 'require "plist";require "json";puts Plist.parse_xml(STDIN.read)["Children"].select{|e|e["Title"]=="com.apple.ReadingList"}[0]["Children"].map{|e|JSON.generate({:url => e["URLString"],:title=>e["URIDictionary"]["title"],:created_at=>e["ReadingList"]["DateAdded"]})}' > ~/Desktop/plist.json
}

function show(){
  DIR=`pwd`
  osascript -l JavaScript ~/jxa_scripts/open_finder.js $DIR
}

mkcd () {
  mkdir "$1"
  cd "$1"
}

mktmp() {
  local TODAY=`date '+%Y%m%d_%H%I%S'`
  mkdir /tmp/$TODAY;cd /tmp/$TODAY;
}

function git_diff_archive()
{
  local diff=""
  local h="HEAD"
  if [ $# -eq 1 ]; then
    if expr "$1" : '[0-9]*' > /dev/null ; then
      diff="HEAD HEAD~${1}"
    else
      diff="HEAD ${1}"
    fi
  elif [ $# -eq 2 ]; then
    diff="${1} ${2}"
    h=$1
  fi
  if [ "$diff" != "" ]; then
    diff="git diff --name-only ${diff}"
  fi
  git archive --format=zip --prefix=root/ $h `eval $diff` -o archive.zip
}

