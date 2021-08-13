view: email_delivered {
  sql_table_name: iterable.email_delivered_view ;;

  dimension: id {
    primary_key: yes
    type: string
    sql: ${TABLE}.id ;;
  }

  dimension: anonymous_id {
    type: string
    sql: ${TABLE}.anonymous_id ;;
  }

  dimension: campaign_id {
    type: string
    sql: ${TABLE}.campaign_id ;;
  }

  dimension: campaign_name {
    type: string
    sql: ${TABLE}.campaign_name ;;
  }

  dimension: email_series_number{
    sql:
      CASE
        WHEN ${campaign_name} LIKE '%.1.%' OR ${campaign_name} LIKE '%EM 1%' OR ${campaign_name} LIKE '%+ Content%' OR ${campaign_name} LIKE '%+ content%' OR ${campaign_name} LIKE '%EM1%'   THEN '1st Email'
        WHEN ${campaign_name} LIKE '%.2.%' OR ${campaign_name} LIKE '%EM 2%' OR ${campaign_name} LIKE '%EM2%' THEN '2nd Email'
        WHEN ${campaign_name} LIKE '%.3.%' OR ${campaign_name} LIKE '%EM 3%' OR ${campaign_name} LIKE '%EM3%' THEN '3rd Email'
        WHEN ${campaign_name} LIKE '%.4.%' OR ${campaign_name} LIKE '%EM 4%' OR ${campaign_name} LIKE '%EM4%' THEN '4th Email'
        ELSE 'Other'
    END;;
  }


  dimension: channel_id {
    type: number
    sql: ${TABLE}.channel_id ;;
  }

  dimension: content_id {
    type: number
    sql: ${TABLE}.content_id ;;
  }

#   dimension: context_integration_name {
#     type: string
#     sql: ${TABLE}.context_integration_name ;;
#   }

#   dimension: context_integration_version {
#     type: string
#     sql: ${TABLE}.context_integration_version ;;
#   }
#
#   dimension: context_library_name {
#     type: string
#     sql: ${TABLE}.context_library_name ;;
#   }
#
#   dimension: context_library_version {
#     type: string
#     sql: ${TABLE}.context_library_version ;;
#   }
#
#   dimension: context_traits_email {
#     type: string
#     sql: ${TABLE}.context_traits_email ;;
#   }

#   dimension: created_at {
#     type: string
#     sql: ${TABLE}.created_at ;;
#   }

  dimension: email {
    type: string
    sql: ${TABLE}.email ;;
  }

  dimension: email_id {
    type: string
    sql: ${TABLE}.email_id ;;
  }

  dimension: email_subject {
    type: string
    sql: ${TABLE}.email_subject ;;
  }

  dimension: event {
    type: string
    sql: ${TABLE}.event ;;
  }
#
#   dimension: event_text {
#     type: string
#     sql: ${TABLE}.event_text ;;
#   }

  dimension: experiment_id {
    type: number
    sql: ${TABLE}.experiment_id ;;
  }

#   dimension_group: loaded {
#     type: time
#     timeframes: [
#       raw,
#       time,
#       date,
#       week,
#       month,
#       quarter,
#       year
#     ]
#     sql: ${TABLE}.loaded_at ;;
#   }
#
#   dimension: message_bus_id {
#     type: string
#     sql: ${TABLE}.message_bus_id ;;
#   }

  dimension: message_id {
    type: string
    sql: ${TABLE}.message_id ;;
  }
#
#   dimension: message_type_id {
#     type: number
#     sql: ${TABLE}.message_type_id ;;
#   }
#
#   dimension: original_timestamp {
#     type: string
#     sql: ${TABLE}.original_timestamp ;;
#   }
#
#   dimension_group: received {
#     type: time
#     timeframes: [
#       raw,
#       time,
#       date,
#       week,
#       month,
#       quarter,
#       year
#     ]
#     sql: ${TABLE}.received_at ;;
#   }

  dimension_group: sent {
    type: time
    timeframes: [
      raw,
      time,
      hour,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.sent_at ;;
  }

  dimension: template_id {
    type: number
    sql: ${TABLE}.template_id ;;
  }

  dimension: template_name {
    type: string
    sql: ${TABLE}.template_name ;;
  }
#
#   dimension_group: timestamp {
#     type: time
#     timeframes: [
#       raw,
#       time,
#       date,
#       week,
#       month,
#       quarter,
#       year
#     ]
#     sql: ${TABLE}.timestamp ;;
#   }

  dimension: transactional_data {
    type: string
    sql: ${TABLE}.transactional_data ;;
  }

  dimension: user_id {
    type: string
    sql: ${TABLE}.user_id ;;
  }
#
#   dimension_group: uuid_ts {
#     type: time
#     timeframes: [
#       raw,
#       time,
#       date,
#       week,
#       month,
#       quarter,
#       year
#     ]
#     sql: ${TABLE}.uuid_ts ;;
#   }

  dimension: workflow_id {
    type: number
    sql: ${TABLE}.workflow_id ;;
  }

  dimension: workflow_name {
    type: string
    sql: ${TABLE}.workflow_name ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  measure: distinct_emails {
    type:  count_distinct
    sql: ${email} ;;
    drill_fields: [detail*]
  }

  # ----- Sets of fields for drilling ------
  set: detail {
    fields: [
      id,
      workflow_name,
      campaign_name,
      template_name
    ]
  }
}
