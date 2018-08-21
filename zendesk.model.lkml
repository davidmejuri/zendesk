connection: "spree_db"

# include all the views
include: "*.view"

explore: audits {
  label: "Ticket Changes"
  sql_always_where: ${requesters.email} NOT IN ('vfe-campaign-response@amazon.com', 'order-update@amazon.ca','noreply.odd@dhl.com','no-reply@amazon.ca','no-reply@amazon.com','nobody@bounces.amazon.com','5qlgtdx4557tnyn@marketplace.amazon.ca','1lm86lykg3b0190@marketplace.amazon.com','auto-communication@amazon.ca','payments-messages@amazon.ca') ;;
  join: tickets {
    type: left_outer
    sql_on: ${audits.ticket_id} = ${tickets.id} ;;
    relationship: many_to_one
  }

  join: organizations {
    type: left_outer
    sql_on: ${tickets.organization_id} = ${organizations.id} ;;
    relationship: many_to_one
  }

  join: requesters {
    from: users
    type: left_outer
    sql_on: ${tickets.requester_id} = ${requesters.id} ;;
    relationship: many_to_one
  }

  join: assignees {
    from: users
    type: left_outer
    sql_on: ${tickets.assignee_id} = ${assignees.id} ;;
    relationship: many_to_one
  }

  join: audits__events {
    #       type: left_outer
    view_label: "Ticket Changes"
    sql_on: ${audits.id} = ${audits__events.audit_id} ;;
    relationship: one_to_many
  }
}



explore: organizations {}

explore: ticket_fields {
  label: "Ticket Fields"

  join: tickets__fields {
    view_label: "Ticket Fields"
    sql_on: ${ticket_fields.id_field_name} = ${tickets__fields.ticket_id} ;;
    relationship: one_to_many
  }
}

explore: tickets {
  sql_always_where: ${requester_email} NOT IN ('vfe-campaign-response@amazon.com','order-update@amazon.ca','noreply.odd@dhl.com','no-reply@amazon.ca','no-reply@amazon.com','nobody@bounces.amazon.com','payments-messages@amazon.ca','5qlgtdx4557tnyn@marketplace.amazon.ca','1lm86lykg3b0190@marketplace.amazon.com','auto-communication@amazon.ca') ;;
  join: organizations {
    type: left_outer
    sql_on: ${tickets.organization_id} = ${organizations.id} ;;
    relationship: many_to_one
  }

  join: requesters {
    from: users
    type: left_outer
    sql_on: ${tickets.requester_id} = ${requesters.id} ;;
    relationship: many_to_one
  }

  join: assignees {
    from: users
    type: left_outer
    sql_on: ${tickets.assignee_id} = ${assignees.id} ;;
    relationship: many_to_one
  }

  join: groups {
    type: left_outer
    sql_on: ${tickets.group_id} = ${groups.id} ;;
    relationship: many_to_one
  }

  join: ticket__tags {
    type: left_outer
    sql_on: ${ticket__tags.ticket_id} = ${tickets.id};;
    relationship: one_to_many
  }
}

explore: ticket__tags {
  sql_always_where: ${requesters.email} NOT IN ('vfe-campaign-response@amazon.com', 'order-update@amazon.ca','noreply.odd@dhl.com','no-reply@amazon.ca','no-reply@amazon.com','nobody@bounces.amazon.com','5qlgtdx4557tnyn@marketplace.amazon.ca','1lm86lykg3b0190@marketplace.amazon.com','auto-communication@amazon.ca','payments-messages@amazon.ca') ;;
  join: tickets {
    type: left_outer
    sql_on: ${ticket__tags.ticket_id} = ${tickets.id} ;;
    relationship: many_to_one
  }

  join: organizations {
    type: left_outer
    sql_on: ${tickets.organization_id} = ${organizations.id} ;;
    relationship: many_to_one
  }

  join: requesters {
    from: users
    type: left_outer
    sql_on: ${tickets.requester_id} = ${requesters.id} ;;
    relationship: many_to_one
  }

  join: assignees {
    from: users
    type: left_outer
    sql_on: ${tickets.assignee_id} = ${assignees.id} ;;
    relationship: many_to_one
  }
}

explore: users {
  join: organizations {
    type: left_outer
    sql_on: ${users.organization_id} = ${organizations.id} ;;
    relationship: many_to_one
  }
}

explore: groups {}

explore: tag_types {}

explore: ticket_metrics {
  sql_always_where: ${requesters.email} NOT IN ('vfe-campaign-response@amazon.com','order-update@amazon.ca','noreply.odd@dhl.com','no-reply@amazon.ca','no-reply@amazon.com','nobody@bounces.amazon.com','payments-messages@amazon.ca','5qlgtdx4557tnyn@marketplace.amazon.ca','1lm86lykg3b0190@marketplace.amazon.com','auto-communication@amazon.ca')   ;;
  join: tickets {
    type: left_outer
    sql_on: ${ticket_metrics.ticket_id} = ${tickets.id} ;;
    relationship: many_to_one
  }

  join: organizations {
    type: left_outer
    sql_on: ${tickets.organization_id} = ${organizations.id} ;;
    relationship: many_to_one
  }

  join: users {
    type: left_outer
    sql_on: ${tickets.assignee_id} = ${users.id} ;;
    relationship: many_to_one
  }

  join: groups {
    type: left_outer
    sql_on: ${tickets.group_id} = ${groups.id} ;;
    relationship: many_to_one
  }

  join: requesters {
    from: users
    type: left_outer
    sql_on: ${tickets.requester_id} = ${requesters.id} ;;
    relationship: many_to_one
  }

  join: assignees {
    from: users
    type: left_outer
    sql_on: ${tickets.assignee_id} = ${assignees.id} ;;
    relationship: many_to_one
  }
  join: ticket__tags {
    type: left_outer
    relationship: one_to_many
    sql_on: ${ticket__tags.ticket_id} = ${ticket_metrics.ticket_id};;
  }
}
