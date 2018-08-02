+++
title = "Backend Services"
slug = "services"
+++

The following applications are currently running as BACKEND services:

{% for url in salt['grains.get']('url-backend', '') -%}
{% set value = url.split(', ') %}
* [{{value[0]}}]({{value[1]}})
{%- endfor %}