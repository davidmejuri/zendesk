- dashboard: ticket_submissions
  title: Ticket Submissions
  layout: tile
#   rows:
#     - elements: [all_tickets, orgs_submitting, avg_tickets_per_org]
#       height: 150
#     - elements: [ticket_stats_by_org]
#       height: 400
#     - elements: [peak_hours, peak_days]
#       height: 400

  filters:

  - name: date
    type: date_filter

  elements:

  - name: all_tickets
    type: single_value
    model: zendesk
    explore: ticket_metrics
    measures: [tickets.count]
    sorts: [tickets.count desc]
    limit: 500
    show_single_value_title: true
    single_value_title: All time tickets submitted
    show_comparison: false
    listen:
      date: tickets.created_at_date

  - name: peak_hours
    title: Peak hours
    type: looker_column
    model: zendesk
    explore: ticket_metrics
    dimensions: [tickets.time_hour_of_day]
    measures: [tickets.count]
    sorts: [tickets.time_hour_of_day]
    limit: 500
    column_limit: 50
    stacking: percent
    show_value_labels: false
    label_density: 25
    legend_position: center
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: true
    limit_displayed_rows: false
    y_axis_combined: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    show_x_axis_label: true
    show_x_axis_ticks: true
    x_axis_scale: auto
    ordering: none
    show_null_labels: false
    listen:
      date: tickets.created_at_date

  - name: peak_days
    title: Peak days
    type: looker_column
    model: zendesk
    explore: ticket_metrics
    dimensions: [tickets.time_day_of_week]
    measures: [tickets.count]
    sorts: [tickets.time_day_of_week]
    limit: 500
    column_limit: 50
    stacking: percent
    show_value_labels: false
    label_density: 25
    legend_position: center
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: true
    limit_displayed_rows: false
    y_axis_combined: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    show_x_axis_label: true
    show_x_axis_ticks: true
    x_axis_scale: auto
    ordering: none
    show_null_labels: false
    listen:
      date: tickets.created_at_date
