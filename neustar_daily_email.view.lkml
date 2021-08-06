view: newstar_daily_email {
  derived_table: {
    sql: SELECT
          email_delivered.email AS email_delivered_email,
          email_delivered.campaign_id AS email_delivered_campaign_id,
          email_delivered.campaign_name AS email_delivered_campaign_name,
              (FORMAT_TIMESTAMP('%F %T', email_delivered.sent_at)) AS email_delivered_sent_time,
              (FORMAT_TIMESTAMP('%F %T', email_bounced.timestamp)) AS email_bounced_timestamp_time,
              (FORMAT_TIMESTAMP('%F %T', email_opened.timestamp)) AS email_opened_timestamp_time,
              (FORMAT_TIMESTAMP('%F %T', unsubscribed.timestamp)) AS unsubscribed_timestamp_time,
              (FORMAT_TIMESTAMP('%F %T', email_link_clicked.timestamp)) AS email_link_clicked_timestamp_time
      FROM
          iterable.email_delivered_view AS email_delivered
          LEFT JOIN iterable.email_opened_view AS email_opened ON email_delivered.message_id = email_opened.message_id
          LEFT JOIN iterable.email_link_clicked_view AS email_link_clicked ON email_delivered.message_id = email_link_clicked.message_id
          FULL JOIN iterable.email_bounced_view AS email_bounced ON email_delivered.message_id = email_bounced.message_id
          LEFT JOIN iterable.unsubscribed_view AS unsubscribed ON email_delivered.email = unsubscribed.email AND email_delivered.message_id = unsubscribed.message_id
      WHERE ((((( email_delivered.sent_at )) >= ((TIMESTAMP_ADD(TIMESTAMP_TRUNC(CURRENT_TIMESTAMP(), HOUR), INTERVAL -11 HOUR))) AND (( email_delivered.sent_at )) < ((TIMESTAMP_ADD(TIMESTAMP_ADD(TIMESTAMP_TRUNC(CURRENT_TIMESTAMP(), HOUR), INTERVAL -11 HOUR), INTERVAL 12 HOUR))))))
      GROUP BY
          1,
          2,
          3,
          4,
          5,
          6,
          7,
          8
      ORDER BY
          4 DESC
      LIMIT 500
      SELECT FLOOR((EXTRACT(epoch from GETDATE()) - 60*60*6)/(60*60*24))
       ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: email_delivered_email {
    type: string
    sql: ${TABLE}.email_delivered_email ;;
  }

  dimension: email_delivered_campaign_id {
    type: number
    sql: ${TABLE}.email_delivered_campaign_id ;;
  }

  dimension: email_delivered_campaign_name {
    type: string
    sql: ${TABLE}.email_delivered_campaign_name ;;
  }

  dimension: email_delivered_sent_time {
    type: string
    sql: ${TABLE}.email_delivered_sent_time ;;
  }

  dimension: email_bounced_timestamp_time {
    type: string
    sql: ${TABLE}.email_bounced_timestamp_time ;;
  }

  dimension: email_opened_timestamp_time {
    type: string
    sql: ${TABLE}.email_opened_timestamp_time ;;
  }

  dimension: unsubscribed_timestamp_time {
    type: string
    sql: ${TABLE}.unsubscribed_timestamp_time ;;
  }

  dimension: email_link_clicked_timestamp_time {
    type: string
    sql: ${TABLE}.email_link_clicked_timestamp_time ;;
  }

  set: detail {
    fields: [
      email_delivered_email,
      email_delivered_campaign_id,
      email_delivered_campaign_name,
      email_delivered_sent_time,
      email_bounced_timestamp_time,
      email_opened_timestamp_time,
      unsubscribed_timestamp_time,
      email_link_clicked_timestamp_time
    ]
  }
}
