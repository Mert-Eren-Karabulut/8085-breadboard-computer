const char ADDR[] = {12, 11, 10, 9, 8, 7, 6, 5, 4, 3, A5, A4, A3, A2, A1, A0};
void setup() {
  for (int n = 0; n < 16; n += 1) {   //Address pins
    pinMode(ADDR[n], INPUT);
  }
  pinMode(13, INPUT);                 //ALE
  Serial.begin(57600);
}

void loop() {
  char output[15];
  int once=0;
  unsigned int address = 0;
  if (digitalRead(13) == 1) {   //ALE
    for (int n = 15; n > -1; n -= 1) {
      int bit = digitalRead(ADDR[n]) ? 1 : 0;
      Serial.print(bit);
      address = (address << 1) + bit;
    }
    sprintf(output, "  %02x", address);
    Serial.println(output);
    delay(4);
  }
}
