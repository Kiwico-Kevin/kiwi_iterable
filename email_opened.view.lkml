view: email_opened {
  sql_table_name: iterable.email_opened ;;

  dimension: id {
    primary_key: yes
    type: string
    hidden: yes
    sql: ${TABLE}.id ;;
  }

  dimension: anonymous_id {
    type: string
    sql: ${TABLE}.anonymous_id ;;
  }

  dimension: campaign_id {
    type: number
    sql: ${TABLE}.campaign_id ;;
  }

  dimension: campaign_name {
    type: string
    sql: ${TABLE}.campaign_name ;;
  }

  dimension: channel_id {
    type: number
    sql: ${TABLE}.channel_id ;;
  }

  dimension: city {
    type: string
    sql: ${TABLE}.city ;;
  }

#   dimension: context_integration_name {
#     type: string
#     sql: ${TABLE}.context_integration_name ;;
#   }
#
#   dimension: context_integration_version {
#     type: string
#     sql: ${TABLE}.context_integration_version ;;
#   }
#
#   dimension: context_ip {
#     type: string
#     sql: ${TABLE}.context_ip ;;
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

  dimension: context_os_name {
    type: string
    sql: ${TABLE}.context_os_name ;;
  }

  dimension: context_traits_email {
    type: string
    sql: ${TABLE}.context_traits_email ;;
  }

  dimension: context_user_agent {
    type: string
    sql: ${TABLE}.context_user_agent ;;
  }

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

  dimension: message_id {
    type: string
    sql: ${TABLE}.message_id ;;
  }

  dimension: message_type_id {
    type: number
    sql: ${TABLE}.message_type_id ;;
  }

#   dimension: original_timestamp {
#     type: string
#     sql: ${TABLE}.original_timestamp ;;
#   }

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

  dimension: region {
    type: string
    sql: ${TABLE}.region ;;
  }

  dimension_group: sent {
    type: time
    timeframes: [
      raw,
      time,
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

  dimension: user_agent_device {
    type: string
    sql: ${TABLE}.user_agent_device ;;
  }

  dimension: user_id {
    type: string
    sql: ${TABLE}.user_id ;;
  }

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
    sql: ${email_id} ;;
    drill_fields: [detail*]
  }
  # ----- Sets of fields for drilling ------
  set: detail {
    fields: [
      id,
      workflow_name,
      campaign_name,
      template_name,
      context_os_name
    ]
  }
}
