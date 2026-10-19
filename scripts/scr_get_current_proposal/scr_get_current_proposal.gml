/// @function scr_get_current_proposal()
/// @description Retorna a proposta correspondente ao dia atual.

if (!variable_global_exists("proposals")) {
    return undefined;
}

for (var i = 0; i < array_length(global.proposals); i++) {
    var _proposal = global.proposals[i];

    if (_proposal.day == global.campaign_day) {
        return _proposal;
    }
}

return undefined;