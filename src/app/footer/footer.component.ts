import { Component, OnInit } from '@angular/core';

@Component({
  selector: 'app-footer',
  templateUrl: './footer.component.html',
  styleUrls: ['./footer.component.css']
})
export class FooterComponent implements OnInit {
  public currentYear: number
  constructor() { }

  ngOnInit() {
  }

  getCurrentYear(): number{
    const year = new Date().getFullYear();
    this.currentYear = year;
    return this.currentYear
  }

}
