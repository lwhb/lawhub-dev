repos=("lawhub" "lawhub-xml" "lawhub-spider" "lawhub-tool" )
for ri in "${!repos[@]}"; do
    repo=${repos[$ri]}
    if [ ! -d ../$repo ]; then
      echo "cloning $repo"
      git clone https://github.com/lwhb/${repo}.git ../$repo
    else
      echo "update $repo"
      cd ../$repo && git checkout master && git pull && cd - || exit
    fi
done
