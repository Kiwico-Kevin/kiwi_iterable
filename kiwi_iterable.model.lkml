connection: "kiwi_iterable"

# include all the views
include: "*.view"

datagroup: kiwi_iterable_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}

persist_with: kiwi_iterable_default_datagroup

explore: email_bounced {}

explore: email_bounced_view {}

explore: email_delivered {}

explore: email_delivered_view {}

explore: email_link_clicked {}

explore: email_link_clicked_view {}

explore: email_marked_as_spam {}

explore: email_marked_as_spam_view {}

explore: email_opened {}

explore: email_opened_view {}

explore: subscribed {}

explore: subscribed_view {}

explore: tracks {}

explore: tracks_view {}

explore: unsubscribed {}

explore: unsubscribed_view {}
