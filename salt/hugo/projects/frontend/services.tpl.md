+++
title = "Frontend Services"
slug = "services"
+++

The following applications are currently running as FRONTEND services:

{% for url in salt['grains.get']('url-frontend', '') -%}
{% set value = url.split(', ') %}
* [{{value[0]}}]({{value[1]}})
{%- endfor %}