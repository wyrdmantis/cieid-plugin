export interface CieIdPlugin {
  echo(options: { value: string }): Promise<{ value: string }>;
}
