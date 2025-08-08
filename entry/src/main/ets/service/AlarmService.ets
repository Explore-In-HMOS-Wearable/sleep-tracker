export class AlarmService {
  private static _alarmDate: Date | null = null;
  static formatToAMPM(date: Date): string {
    let hour = date.getHours();
    const minute = String(date.getMinutes()).padStart(2, '0');
    const ampm = hour >= 12 ? 'PM' : 'AM';
    hour = hour % 12;
    hour = hour === 0 ? 12 : hour;
    return `${hour}:${minute} ${ampm}`;
  }
  static setAlarm(date: Date) {
    AlarmService._alarmDate = date;
    console.info(`[AlarmService] Alarm set to: ${date.toLocaleString()}`)
  }

  static getAlarm(): Date | null {
    return AlarmService._alarmDate;
  }

  static clearAlarm() {
    AlarmService._alarmDate = null;
  }
}
