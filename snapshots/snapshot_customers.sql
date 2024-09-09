{% snapshot snapshot_customers %}
    {{
        config(
            target_schema='snapshots',
            target_database='default_db',
            unique_key='id',
            strategy='timestamp',
            updated_at='updated_at'
        )
    }}

    select * from {{ source('cust', 'customers') }}
 {% endsnapshot %}