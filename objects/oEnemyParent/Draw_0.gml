draw_self();

var _healthPercent = hp / maxHp;
var _hpImg = _healthPercent * ( sprite_get_number(sEnemyHealth) -1 );
draw_sprite(sEnemyHealth, _hpImg, x, y-sprite_height-1);
