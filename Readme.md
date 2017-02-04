chef-solo 사용 순서 요약

## home directory 생생
## ./run.sh 으로 도커실행

## 레시피 생성
## JSON 파일로 실행할 레시피 지정
## chef-solo 명령어로 실행

# git repo template 다운

```
git clone git://github.com/opscode/chef-repo.git
```

# knife configure
knife configure

#cd .chef/  에 설치됨

쿡북 생성
```
# git clone git://github.com/opscode/cookbooks.git
Initialized empty Git repository in /game/chef-repo/cookbooks/.git/
remote: Reusing existing pack: 18242, done.
remote: Total 18242 (delta 0), reused 0 (delta 0)
Receiving objects: 100% (18242/18242), 9.04 MiB | 2.16 MiB/s, done.
Resolving deltas: 100% (6971/6971), done.
```

예제 cookbook 생성
# cd chef-repo
# knife cookbook create hello -o cookbooks
** Creating cookbook hello
** Creating README for cookbook: hello
** Creating metadata for cookbook: hello

레시피 편집
# vim cookbooks/hello/recipes/default.rb

log "Hello, Chef!"

chef solo 실행 시 사용할 레시피를 포함하는 JSON 파일 준비
chef-repo/localhost.json
```
{
        "run_list" : [
                "recipe[hello]"
        ]
}
```
solo.rb 파일 생성
```
file_cache_path "/tmp/chef-solo"
cookbook_path ["/game/chef-repo/cookbooks"]
```
chef-solo 실행
```
# chef-solo -c solo.rb -j localhost.json
[Mon, 14 Apr 2014 17:25:35 +0900] INFO: *** Chef 0.10.6 ***
[Mon, 14 Apr 2014 17:25:35 +0900] INFO: Setting the run_list to ["recipe[hello]"] from JSON
[Mon, 14 Apr 2014 17:25:35 +0900] INFO: Run List is [recipe[hello]]
[Mon, 14 Apr 2014 17:25:35 +0900] INFO: Run List expands to [hello]
[Mon, 14 Apr 2014 17:25:35 +0900] INFO: Starting Chef Run for localhost
[Mon, 14 Apr 2014 17:25:35 +0900] INFO: Running start handlers
[Mon, 14 Apr 2014 17:25:35 +0900] INFO: Start handlers complete.
[Mon, 14 Apr 2014 17:25:35 +0900] INFO: Processing log[Hello, Chef!] action write (hello::default line 9)
[Mon, 14 Apr 2014 17:25:35 +0900] INFO: Hello, Chef!
[Mon, 14 Apr 2014 17:25:35 +0900] INFO: Chef Run complete in 0.002279 seconds
[Mon, 14 Apr 2014 17:25:35 +0900] INFO: Running report handlers
[Mon, 14 Apr 2014 17:25:35 +0900] INFO: Report handlers complete
```
