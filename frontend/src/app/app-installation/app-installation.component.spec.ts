import { async, ComponentFixture, TestBed } from "@angular/core/testing";
import {} from "jasmine";
import { InstallationComponent } from "./app-installation.component";

describe("InstallationComponent", () => {
  let component: InstallationComponent;
  let fixture: ComponentFixture<InstallationComponent>;

  beforeEach(
    async(() => {
      TestBed.configureTestingModule({
        declarations: [InstallationComponent]
      }).compileComponents();
    })
  );

  beforeEach(() => {
    fixture = TestBed.createComponent(InstallationComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it("should create", () => {
    expect(component).toBeTruthy();
  });
});
