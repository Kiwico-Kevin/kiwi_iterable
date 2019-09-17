connection: "kiwi_iterable"

# include all the views
include: "*.view"

datagroup: kiwi_iterable_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}

persist_with: kiwi_iterable_default_datagroup

#explore: email_bounced {}

#explore: email_bounced_view {}

explore: email_delivered {
  join: email_opened {
    type: left_outer
    sql_on: ${email_delivered.message_id} = ${email_opened.message_id} ;;
    relationship: many_to_many
  }
  join: email_link_clicked {
    type: left_outer
    sql_on: ${email_delivered.message_id} = ${email_link_clicked.message_id} ;;
    relationship: many_to_many
  }
  join: email_bounced {
    type: full_outer
    sql_on: ${email_delivered.message_id} = ${email_bounced.message_id} ;;
    relationship: many_to_many
  }
  join: unsubscribed_view {
    type: left_outer
    sql_on: ${email_delivered.email} =${unsubscribed_view.email}  AND ${email_delivered.message_id} = ${unsubscribed_view.message_id};;
    relationship: many_to_many
  }
}

#explore: email_delivered_view {}

explore: email_link_clicked {}

#explore: email_link_clicked_view {}

explore: email_marked_as_spam {}

#explore: email_marked_as_spam_view {}

explore: email_opened {}

#explore: email_opened_view {}

explore: subscribed {}

#explore: subscribed_view {}

explore: tracks {}

#explore: tracks_view {}

explore: unsubscribed {}

#explore: unsubscribed_view {}
