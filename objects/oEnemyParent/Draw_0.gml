draw_self();

var _healthPercent = hp / maxHp;
var _hpImg = _healthPercent * ( sprite_get_number(sEnemyHealth) -1 );
draw_sprite(sEnemyHealth, _hpImg, x, y-sprite_height-1);


if id == oPlayer.lockedEnemy  
{  
    draw_set_color(c_red);  
    draw_circle(x, y, image_xscale * 10, false); // Adjust size as needed  
}