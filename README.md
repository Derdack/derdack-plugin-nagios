# Derdack Enterprise Alert Plugin for Nagios

## Why Enterprise Alert

In case of critical incidents in 24/7 IT operations with Nagios, Enterprise Alert is your on-premise tool for instant mobile alerting. Enterprise Alert adds critical mobile alerting to Nagios in no time. It bridges the ‘last mile’ from Nagios to IT staff and on-call engineers.

Enterprise Alert is an enterprise-class alerting solution for on-premises and private cloud deployments. It combines reliable alerting (including app push, SMS, voice calls, email, tracking and escalations), collaboration, duty scheduling and remote remediation.

Enterprise Alert leads to an up to 10x faster incident response, 60% reduces downtime of critical systems and 95% less false alerts.

![Enterprise Alert](Infographic.png)

## Setup

In the following we describe the setup and configuration of the Enterprise Alert Plugin for Nagios:

1. If not already available you can request a demo of Enterprise Alert here https://www.derdack.com/request-a-demo/.

2. In Enterprise Alert (System -> Event Sources -> New Source -> REST API Client) you can create a new REST API end point.

3. Copy the two scripts ("ea_host_notify.sh" and "ea_service_notify.sh") to your Nagios plugin directory (the location may vary).

4. Edit the Enterprise Alert REST API URLs in these scripts to the match your REST API URL including your API Key.

5. Define the new notification commands in the Nagios configuration (a sample configuration is available in the file "ea_commands.cfg"). Please, modify the paths accordingly.

6. Set up a new contact in Nagios or use an existing one to add notification commands for host and service. You can find an example below:

```
define contact{
        contact_name                    root
        alias                           Root
        service_notifications_enabled   1
        host_notifications_enabled      1
        service_notification_period     24x7
        host_notification_period        24x7
        service_notification_options    w,u,c,r
        host_notification_options       d,r
        service_notification_commands   ea-service,notify-service-by-email
        host_notification_commands      ea-host,notify-host-by-email
        email                           root@localhost
        }
```

7. Now you can test it by simulating an incident. When Nagios detects the issue, the information will be forwarded to Enterprise Alert and you can create your Alert Policy accordingly.

