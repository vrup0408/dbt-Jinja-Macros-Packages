-- Execute below statement in another statement tab
-- select * from analytics.dbt_vparikh_snapshot.mock_orders



{% snapshot mock_orders %}

{% set new_schema = target.schema + '_snapshot' %}

{{
    config(
      target_database='analytics',
      target_schema=new_schema,
      unique_key='order_id',

      strategy='timestamp',
      updated_at='updated_at'
    )
}}

select * from analytics.{{target.schema}}.mock_orders

{% endsnapshot %}