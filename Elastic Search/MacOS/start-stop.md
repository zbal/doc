If this is your first install, automatically load ElasticSearch on login with:
    mkdir -p ~/Library/LaunchAgents
    ln -nfs /usr/local/Cellar/elasticsearch/0.19.0/homebrew.mxcl.elasticsearch.plist ~/Library/LaunchAgents/
    launchctl load -wF ~/Library/LaunchAgents/homebrew.mxcl.elasticsearch.plist

If this is an upgrade and you already have the homebrew.mxcl.elasticsearch.plist loaded:
    launchctl unload -w ~/Library/LaunchAgents/homebrew.mxcl.elasticsearch.plist
    ln -nfs /usr/local/Cellar/elasticsearch/0.19.0/homebrew.mxcl.elasticsearch.plist ~/Library/LaunchAgents/
    launchctl load -wF ~/Library/LaunchAgents/homebrew.mxcl.elasticsearch.plist

To stop the ElasticSearch daemon:
    launchctl unload -wF ~/Library/LaunchAgents/homebrew.mxcl.elasticsearch.plist

To start ElasticSearch manually:
    elasticsearch -f -D es.config=/usr/local/Cellar/elasticsearch/0.19.0/config/elasticsearch.yml

See the 'elasticsearch.yml' file for configuration options.

You'll find the ElasticSearch log here:
    open /usr/local/var/log/elasticsearch/elasticsearch_balou.log

The folder with cluster data is here:
    open /usr/local/var/elasticsearch/elasticsearch_balou/

You should see ElasticSearch running:
    open http://localhost:9200/