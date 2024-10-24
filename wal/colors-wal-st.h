const char *colorname[] = {

  /* 8 normal colors */
  [0] = "#0c0e1a", /* black   */
  [1] = "#4361AD", /* red     */
  [2] = "#C056B0", /* green   */
  [3] = "#52A5D5", /* yellow  */
  [4] = "#6499E0", /* blue    */
  [5] = "#AD9BA9", /* magenta */
  [6] = "#9CAADD", /* cyan    */
  [7] = "#d9d5dc", /* white   */

  /* 8 bright colors */
  [8]  = "#97959a",  /* black   */
  [9]  = "#4361AD",  /* red     */
  [10] = "#C056B0", /* green   */
  [11] = "#52A5D5", /* yellow  */
  [12] = "#6499E0", /* blue    */
  [13] = "#AD9BA9", /* magenta */
  [14] = "#9CAADD", /* cyan    */
  [15] = "#d9d5dc", /* white   */

  /* special colors */
  [256] = "#0c0e1a", /* background */
  [257] = "#d9d5dc", /* foreground */
  [258] = "#d9d5dc",     /* cursor */
};

/* Default colors (colorname index)
 * foreground, background, cursor */
 unsigned int defaultbg = 0;
 unsigned int defaultfg = 257;
 unsigned int defaultcs = 258;
 unsigned int defaultrcs= 258;
