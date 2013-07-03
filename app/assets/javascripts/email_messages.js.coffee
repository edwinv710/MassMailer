jQuery ->
 $('#messages').dataTable
   sPaginationType: "full_numbers"
   bJQueryUI: true
   bProcessing: true
   bServerSide: true
   sAjaxSource: $('#email_messages').data('source')