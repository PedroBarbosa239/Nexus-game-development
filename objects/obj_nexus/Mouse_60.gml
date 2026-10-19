/// ROLAR DOCUMENTO PARA CIMA

if (!documents_open) exit;
if (selected_document_id == "") exit;

document_scroll = max(0, document_scroll - 44);

show_debug_message(
    "Scroll para cima: " + string(document_scroll)
);