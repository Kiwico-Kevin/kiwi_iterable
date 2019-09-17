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

explore: email_delivered_view {
  label: "Email Delivered"
  join: email_opened_view {
    view_label: "Email Opened"
    type: left_outer
    sql_on: ${email_delivered_view.message_id} = ${email_opened_view.message_id} ;;
    relationship: many_to_many
  }
  join: email_link_clicked_view {
    view_label: "Email Link Clicked"
    type: left_outer
    sql_on: ${email_delivered_view.message_id} = ${email_link_clicked_view.message_id} ;;
    relationship: many_to_many
  }
  join: email_bounced_view {
    view_label: "Email Bounced"
    type: full_outer
    sql_on: ${email_delivered_view.message_id} = ${email_bounced_view.message_id} ;;
    relationship: many_to_many
  }
  join: unsubscribed_view {
    type: left_outer
    sql_on: ${email_delivered_view.email} =${unsubscribed_view.email}  AND ${email_delivered_view.message_id} = ${unsubscribed_view.message_id};;
    relationship: many_to_many
  }
}

explore: sendgrid_delivered_view {
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
