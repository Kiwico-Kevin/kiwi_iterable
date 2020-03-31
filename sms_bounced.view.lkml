view: sms_bounced {
  sql_table_name: iterable.sms_bounced_view ;;
  drill_fields: [id]

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

  dimension: content_id {
    type: number
    sql: ${TABLE}.content_id ;;
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
#   dimension: context_library_name {
#     type: string
#     sql: ${TABLE}.context_library_name ;;
#   }
#
#   dimension: context_library_version {
#     type: string
#     sql: ${TABLE}.context_library_version ;;
#   }

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

#   dimension: event {
#     type: string
#     sql: ${TABLE}.event ;;
#   }
#
#   dimension: event_text {
#     type: string
#     sql: ${TABLE}.event_text ;;
#   }
#
#   dimension: from_phone_number_id {
#     type: number
#     sql: ${TABLE}.from_phone_number_id ;;
#   }
#
#   dimension: from_smssender_id {
#     type: number
#     sql: ${TABLE}.from_smssender_id ;;
#   }

  dimension: image_url {
    type: string
    sql: ${TABLE}.image_url ;;
  }

  dimension: labels {
    type: string
    sql: ${TABLE}.labels ;;
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
  dimension: message_id {
    type: string
    hidden: yes
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
#
#   dimension_group: sent {
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
#     sql: ${TABLE}.sent_at ;;
#   }

  dimension: sms_message {
    type: string
    sql: ${TABLE}.sms_message ;;
  }

  dimension: template_id {
    type: number
    sql: ${TABLE}.template_id ;;
  }

  dimension: template_name {
    type: string
    sql: ${TABLE}.template_name ;;
  }

  dimension_group: timestamp {
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
    sql: ${TABLE}.timestamp ;;
  }

  dimension: to_phone_number {
    type: string
    sql: ${TABLE}.to_phone_number ;;
  }

#   dimension: transactional_data {
#     type: string
#     sql: ${TABLE}.transactional_data ;;
#   }

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

  measure: distinct_user {
    type:  count_distinct
    sql: ${anonymous_id} ;;
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
