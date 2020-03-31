view: 3m_open {
  derived_table: {
    sql: SELECT distinct email FROM `kiwi-data-warehouse.iterable.email_opened` where loaded_at>'2020-01-01'
      ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: email {
    type: string
    sql: ${TABLE}.email ;;
  }

  set: detail {
    fields: [email]
  }
}
