import { registerPlugin } from '@capacitor/core';

import type { CieIdPlugin } from './definitions';

const CieId = registerPlugin<CieIdPlugin>('CieId', {
  web: () => import('./web').then((m) => new m.CieIdWeb()),
});

export * from './definitions';
export { CieId };
