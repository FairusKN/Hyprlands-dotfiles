static const char norm_fg[] = "#d9d5dc";
static const char norm_bg[] = "#0c0e1a";
static const char norm_border[] = "#97959a";

static const char sel_fg[] = "#d9d5dc";
static const char sel_bg[] = "#C056B0";
static const char sel_border[] = "#d9d5dc";

static const char urg_fg[] = "#d9d5dc";
static const char urg_bg[] = "#4361AD";
static const char urg_border[] = "#4361AD";

static const char *colors[][3]      = {
    /*               fg           bg         border                         */
    [SchemeNorm] = { norm_fg,     norm_bg,   norm_border }, // unfocused wins
    [SchemeSel]  = { sel_fg,      sel_bg,    sel_border },  // the focused win
    [SchemeUrg] =  { urg_fg,      urg_bg,    urg_border },
};
