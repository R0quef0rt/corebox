seedbox

List all minions
salt-run manage.up

Apply highstate on all minions
salt '*' state.highstate saltenv=dev pillarenv=dev

Return fgdn for all minions
salt '*' grains.item fqdn

Return all grains for every minion
salt '*' grains.items

Lookup job id results
salt-run jobs.lookup_jid <job id number>

List recently completed jobs
salt-run jobs.list_jobs