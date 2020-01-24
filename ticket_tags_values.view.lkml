view: ticket__tags {
  sql_table_name: zendesk_ch.tickets__tags ;;

  dimension: ticket_id {
    type: number
    sql: ${TABLE}._sdc_source_key_id ;;
  }

  dimension: value {
    type: string
    sql: ${TABLE}.value ;;
  }

  dimension: ada_tier1 {
    type: string
    sql: CASE
    WHEN ${TABLE}.value = 'ada'
    AND ${TABLE}.value = 'tier1'
    THEN '1'
    ELSE '0'
    END ;;
  }

  dimension_group: created_at {
    type: time
    timeframes: [time, date, week, month]
    sql: ${tickets.created_at_time}::timestamp ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
  measure: sonar_count {
    type: count
    filters: {
      field: value
      value: "sonar"
    }
  }
}
