/// ROLAR DOCUMENTO PARA BAIXO

if (!documents_open) exit;
if (selected_document_id == "") exit;

document_scroll += 44;

show_debug_message(
    "Scroll para baixo: " + string(document_scroll)
);