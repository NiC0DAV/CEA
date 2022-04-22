export class lista_asistencia{
    constructor(
        public id: number,
        public idHorario: string,
        public numeroDocumento: string, 
        public numDocProfesor: string,
        public materia: string,
        public fechaAsistencia: string,
        public Asistencia: string
    ){

    }
}